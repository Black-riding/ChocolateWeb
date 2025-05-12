from django.shortcuts import render

# Create your views here.

#API
from rest_framework.viewsets import ModelViewSet
from member.serializers import MemberSerializers

import hashlib

from .models import Member
from django.http import HttpResponseRedirect, HttpResponse  # HttpResponseRedirect倒轉(轉向的意思)

import random
import string


# 註冊
def register(request):
    msg = ""

    if "uName" in request.POST:
        name = request.POST['uName']
        email = request.POST['email']
        sex = request.POST['sex']
        tel = request.POST['tel']
        address = request.POST['address']
        birthday = request.POST['birthday']
        pwd = request.POST['pwd']
        # 最新sha3_256加密
        password = hashlib.sha3_256(pwd.encode('utf-8')).hexdigest()

        obj = Member.objects.filter(email=email).count()  # count()記數

        if obj == 0:

            number = string.digits  # .digits只要數字
            txt = string.ascii_letters  # .ascii_letters只要大小英文
            data = list(number + txt)

            random.shuffle(data)  # 打散串列排序

            vcode = ''.join(data[:5])  # join將字串合併[:只取前5個]

            o = Member.objects.create(name=name, sex=sex, email=email, tel=tel, address=address, birthday=birthday,
                                      password=password, verufycode=vcode)
            msg = "已完成註冊"
        else:
            msg = "此email已註冊完成"
    return render(request, 'register.html', locals())


# 登入
def login(request):
    msg = ""

    if "email" in request.POST:
        email = request.POST['email']
        password = request.POST['password']
        password = hashlib.sha3_256(password.encode('utf-8')).hexdigest()

        obj = Member.objects.filter(email=email, password=password).count()

        if obj > 0:
            request.session['myEmail'] = email
            request.session['isAlive'] = True
            request.session['lcc'] = 'good'

            response = HttpResponseRedirect("/")  # HttpResponseRedirect導向哪裡("/")這是首頁

            response.set_cookie('UMail', email, max_age=1200)  # 設定cookie('名稱',,max_age設定存活時間)
            return response
        else:
            msg = '輸入帳號密碼錯誤！！'
    return render(request, 'login.html', locals())


# 登出
def logout(request):
    del request.session['myEmail']
    del request.session['isAlive']
    del request.session['lcc']
    # 也可以這樣刪
    # request.session.clear() 這是刪除全部資料

    response = HttpResponseRedirect('/')
    response.delete_cookie("UMail")  # 刪除cookie

    return response


# 修改密碼
def changePwd(request):
    if 'myEmail' in request.session and 'lcc' in request.session:

        msg = ''

        if 'oldPwd' in request.POST:
            oldPwd = request.POST['oldPwd']
            newPwd = request.POST['newPwd']

            oldPwd = hashlib.sha3_256(oldPwd.encode('utf-8')).hexdigest()
            newPwd = hashlib.sha3_256(newPwd.encode('utf-8')).hexdigest()

            email = request.session['myEmail']
            obj = Member.objects.filter(email=email,password=oldPwd).count()
            if obj > 0:
                user = Member.objects.get(email=email)
                user.password = newPwd
                user.save()  # 存檔
                msg = "密碼變更成功"
            else:
                msg = "舊密碼輸入錯誤"
        return render(request,'changePwd.html',locals())
    else:
        return HttpResponseRedirect('/login')

class MemberViewSet(ModelViewSet):
    queryset =Member.objects.all()
    serializer_class = MemberSerializers