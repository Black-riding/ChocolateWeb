from django.shortcuts import render, redirect

# Create your views here.
from django.http import HttpResponseRedirect  # 導轉

from cart import models
from product.models import Goods  # 抓商品裡面的資料
from django.utils.html import format_html  # html

#API
from rest_framework.viewsets import ModelViewSet
from cart.serializers import cartSerializers
from cart.models import DetailModel

# ---綠界
import os

basedir = os.path.dirname(__file__)  # 抓取現在的目錄
file = os.path.join(basedir, 'ecpay_payment_sdk.py')  # #崁入第三方金流sdk

import importlib.util

spec = importlib.util.spec_from_file_location(
    "ecpay_payment_sdk",
    file  # "/path/to/ecpay_payment_sdk.py"他給的路徑改成自己寫好的file
)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
from datetime import datetime

# ---


cartlist = list() #購物車的串列
customname = ""
customphone = ""
customaddress = ""
customemail = ""

orderTotal = 0
goodsTitle = list()


# 購物車功能
def addtocart(request, ctype=None, productid=None): #顯示購物車內容
    global cartlist #抓購物車內容(設定全域變數)
    # 新增
    if ctype == 'add':
        product = Goods.objects.filter(id=productid).count()  # filter抓資料(抓id=productid帶進來的值)
        if product > 0:  # 判斷有沒有此產品(>0代表有)
            product = Goods.objects.get(id=productid)
            flag = True  # 購物車沒有相同東西

            # unit[0]商品名子
            # unit[1]商品單價
            # unit[2]商品數量
            # unit[3]商品總價
            # 列出購物車
            for unit in cartlist:
                if product.name == unit[0]:  # 抓購物車商品名子有沒有相同
                    unit[2] = str(int(unit[2]) + 1)
                    unit[3] = str(int(unit[3]) + product.price)
                    flag = False
                    break
            if flag:
                templist = list()
                templist.append(product.name)
                templist.append(str(product.price))
                templist.append("1")
                templist.append(str(product.price))
                cartlist.append(templist)
            request.session['cartlist'] = cartlist
            return redirect('/cart/')



        else:
            return redirect('/product/')
    # 更新數量
    elif ctype == "update":
        n = 0
        for unit in cartlist:
            amount = request.POST.get('qty' + str(n), '1')  # get(n,(預設)'1')
            if len(amount) == 0:
                amount = '1'
            if int(amount) <= 0:
                amount = '1'
            unit[2] = amount
            unit[3] = str(int(unit[1]) * int(unit[2]))
            n += 1
        request.session['cartlist'] = cartlist
        return redirect('/cart/')

    # 刪除
    elif ctype == 'delete':
        del cartlist[int(productid)]  # 索引值
        request.session['cartlist'] = cartlist
        return redirect('/cart/')

    # 清空
    elif ctype == 'empty':
        cartlist = list()
        request.session['cartlis'] = cartlist
        return redirect('/cart/')


# 顯示購物車內容
def cart(request):
    global cartlist
    goodslist = cartlist
    total = 0

    for unit in cartlist:
        total += int(unit[3])  # 計算商品總價

    discount = 0 #折扣金額
    shipping = 120 #運費

    if total > 1000:
        discount = 100
    if total > 2000:
        shipping = 0
    grandtotal = total - discount + shipping

    if len(goodslist) == 0:
        empty = 1
    else:
        empty = 0

    return render(request, 'cart.html', locals())


# 結帳沒有登入
def cartorder(request):
    if 'myEmail' in request.session:
        global cartlist, customname, customphone, customaddress, customemail
        total = 0
        goodslist = cartlist

        for unit in cartlist:
            total += int(unit[3])

        discount = 0  # 折扣金額
        shipping = 120  # 運費

        if total > 1000:
            discount = 100
        if total > 2000:
            shipping = 0
        grandtotal = total - discount + shipping

        name = customname
        phone = customphone
        address = customaddress
        email = customemail

        return render(request, 'cartorder.html', locals())
    else:
        return redirect('/login')


# 建立訂單
def cartok(request):
    if 'myEmail' in request.session:
        if 'cuName' in request.POST:
            global cartlist, customname, customphone, customaddress, customemail, orderTotal, goodsTitle
            total = 0

            for unit in cartlist:
                total += int(unit[3])

            discount = 0  # 折扣金額
            shipping = 120  # 運費

            if total > 1000:
                discount = 100
            if total > 2000:
                shipping = 0
            grandtotal = total - discount + shipping

            orderTotal = grandtotal  # 訂單金額

            customname = request.POST.get('cuName')
            customphone = request.POST.get('phone')
            customaddress = request.POST.get('address')
            customemail = request.POST.get('email')
            paytype = request.POST.get('paytype')
            # 訂單(重點.create建立)
            unitorder = models.OrderModel.objects.create(subtotal=total, shipping=shipping, grandtotal=grandtotal,
                                                         customname=customname, customphone=customphone,
                                                         customaddress=customaddress, customemail=customemail,
                                                         paytype=paytype)

            # 新增明細(抓取訂單)
            for unit in cartlist:
                goodsTitle.append(unit[0])
                total = int(unit[1]) * int(unit[2])
                unitdetail = models.DetailModel.objects.create(dorder=unitorder, pname=unit[0], unitprice=unit[1],
                                                               quantity=unit[2], dtotal=total)
            orderid = unitorder.id
            name = unitorder.customname
            email = unitorder.customemail
            cartlist = list()
            request.session['cartlist'] = cartlist
            # 選擇付款方式
            if paytype == '信用卡':
                return HttpResponseRedirect('/creditcard', locals())
            else:
                return render(request, 'cartok.html', locals())
    else:
        return redirect('/login')


# 查詢訂單明細
def cartordercheck(request):
    # 盼但訂單編號跟email要相同才查詢的到
    if 'orderid' in request.GET and 'customemail' in request.GET:
        orderid = request.GET.get('orderid')
        customemail = request.GET.get('customemail')
        if orderid == '' or customemail == '':
            nosearch = 1
        else:
            order = models.OrderModel.objects.filter(id=orderid, customemail=customemail).first()  # .first()只抓一筆
            if order == None:
                notfound = 1
            else:
                details = models.DetailModel.objects.filter(dorder=order)
    return render(request, 'cartordercheck.html', locals())


# 訂單列表
def myorder(request):
    if 'myEmail' in request.session:
        email = request.session['myEmail']
        order = models.OrderModel.objects.filter(customemail=email)

        return render(request, 'myorder.html', locals())
    else:
        return redirect('/login')


# 驗證碼
def reportBank(request):
    if 'orderid' in request.GET and 'customemail' in request.GET:
        orderid = request.GET.get('orderid')
        customemail = request.GET.get('customemail')

        if orderid != '' and customemail != '':
            bank = models.OrderModel.objects.filter(id=orderid, customemail=customemail, paytype='ATM轉帳')
            if bank == None:
                # 如果沒有此訂單
                return render(request, 'product.html')
            else:
                return render(request, 'bankfive.html', locals())
        else:
            return render(request, 'news.html')

    else:
        return render(request, 'news.html')


# 歷史訂單
def bankfiveok(request):
    if 'orderid' in request.POST:
        orderid = request.POST['orderid']
        bankfive = request.POST['bankfive']
        email = request.session['myEmail']
        obj = models.OrderModel.objects.filter(id=orderid, customemail=email).count()

        if obj > 0:
            bank = models.OrderModel.objects.get(id=orderid)
            bank.fivecode = bankfive
            bank.save()  # 儲存

            order = models.OrderModel.objects.filter(customemail=email)  # 抓取所以email的訂單
            return render(request, 'myorder.html', locals())
    else:
        return render(request, 'news.html')


# 綠界-信用卡
def ECPayCredit(request):
    global goodsTitle
    title = ''
    for unit in goodsTitle:
        title += unit + '#'  # 多個商品名稱，要用#來隔開 -->

    order_params = {
        'MerchantTradeNo': datetime.now().strftime("NO%Y%m%d%H%M%S"),
        'StoreID': '',
        'MerchantTradeDate': datetime.now().strftime("%Y/%m/%d %H:%M:%S"),
        'PaymentType': 'aio',
        'TotalAmount': orderTotal,  # 訂單金額
        'TradeDesc': '訂單測試',
        'ItemName': title,  # <--這裡
        'ReturnURL': 'https://www.ecpay.com.tw/return_url.php', #綠界刷卡後，將結果回傳的網址
        'ChoosePayment': 'Credit',
        'ClientBackURL': 'http://127.0.0.1:8000/cartordercheck/', #當使用者點選返回鍵時，傳送的網址
        'ItemURL': 'https://www.ecpay.com.tw/item_url.php',
        'Remark': '交易備註',
        'ChooseSubPayment': '',
        'OrderResultURL': 'http://127.0.0.1:8000/ecpsuccess/', #付款完成後回傳的網址
        'NeedExtraPaidInfo': 'Y',
        'DeviceSource': '',
        'IgnorePayment': '',
        'PlatformID': '',
        'InvoiceMark': 'N',
        'CustomField1': '',
        'CustomField2': '',
        'CustomField3': '',
        'CustomField4': '',
        'EncryptType': 1,
    }

    extend_params_1 = {
        'BindingCard': 0,
        'MerchantMemberID': '',
    }

    extend_params_2 = {
        'Redeem': 'N',
        'UnionPay': 0,
    }

    inv_params = {
        # 'RelateNumber': 'Tea0001', # 特店自訂編號
        # 'CustomerID': 'TEA_0000001', # 客戶編號
        # 'CustomerIdentifier': '53348111', # 統一編號
        # 'CustomerName': '客戶名稱',
        # 'CustomerAddr': '客戶地址',
        # 'CustomerPhone': '0912345678', # 客戶手機號碼
        # 'CustomerEmail': 'abc@ecpay.com.tw',
        # 'ClearanceMark': '2', # 通關方式
        # 'TaxType': '1', # 課稅類別
        # 'CarruerType': '', # 載具類別
        # 'CarruerNum': '', # 載具編號
        # 'Donation': '1', # 捐贈註記
        # 'LoveCode': '168001', # 捐贈碼
        # 'Print': '1',
        # 'InvoiceItemName': '測試商品1|測試商品2',
        # 'InvoiceItemCount': '2|3',
        # 'InvoiceItemWord': '個|包',
        # 'InvoiceItemPrice': '35|10',
        # 'InvoiceItemTaxType': '1|1',
        # 'InvoiceRemark': '測試商品1的說明|測試商品2的說明',
        # 'DelayDay': '0', # 延遲天數
        # 'InvType': '07', # 字軌類別
    }

    # 建立實體
    ecpay_payment_sdk = module.ECPayPaymentSdk(
        MerchantID='2000132',
        HashKey='5294y06JbISpM5x9',
        HashIV='v77hoKGq4kWxNNIS'
    )

    # 合併延伸參數
    order_params.update(extend_params_1)
    order_params.update(extend_params_2)

    # 合併發票參數
    order_params.update(inv_params)

    try:
        # 產生綠界訂單所需參數
        final_order_params = ecpay_payment_sdk.create_order(order_params)

        # 產生 html 的 form 格式
        action_url = 'https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5'  # 測試環境
        # action_url = 'https://payment.ecpay.com.tw/Cashier/AioCheckOut/V5' # 正式環境
        html = ecpay_payment_sdk.gen_html_post_form(action_url, final_order_params)

        html = format_html(html)  # django幫你HTML文字格式化
        return render(request, 'paycredit.html', locals())  # 再導入網站
    except Exception as error:
        print('發生了異常: ' + str(error))

from django.views.decorators.csrf import csrf_exempt
@csrf_exempt
def ecpsuccess(request):
    if 'RtnMsg' in request.POST:
        code = request.POST.get('RtnCode')
        msg = request.POST.get('RtnMsg')
        payorder = request.POST.get('MerchantTradeNo')
        price = request.POST.get('TradeAmt')

        return render(request, 'patreport.html', locals())
    else:
        return redirect('/login')

def returnok(request):
    status = "1|OK"
    print("status",status)
    return render(request,'returnok.html',locals())

#API
class CartViewSet(ModelViewSet):
    queryset =DetailModel.objects.all()
    serializer_class = cartSerializers

