from django.db import models

# Create your models here.

class OrderModel(models.Model):  # Order是django裡面的排續，關鍵字(不可用)

    subtotal = models.IntegerField(default=0)  # 小記
    shipping = models.IntegerField(default=0)  # 運費
    grandtotal = models.IntegerField(default=0)  # 總計

    customname = models.CharField(max_length=50)  # 收件人姓名
    customemail = models.CharField(max_length=100)  # 收件人信箱
    customphone = models.CharField(max_length=15)  # 收件人電話
    customaddress = models.CharField(max_length=100)  # 收件人地址
    create_date = models.DateTimeField(auto_now_add=True)  # 訂單日期
    fivecode = models.CharField(max_length=10, null=True)  # 驗證碼
    paytype = models.CharField(max_length=10)  # 付款方式
    paymentype = models.CharField(max_length=10)  # 付款型態

    def __str__(self):
        return self.customname


class DetailModel(models.Model):
    #ForeignKey一對多關係
    dorder = models.ForeignKey('OrderModel',on_delete=models.CASCADE)  # on_delete = models.CASCADE 當資料庫裡面的訂單刪除，DetailModel裡面的資料都會刪除

    pname = models.CharField(max_length=100)
    unitprice = models.IntegerField(default=0)  # 單價
    quantity = models.IntegerField(default=1)  # 數量
    dtotal = models.IntegerField(default=0) #總價

    def __str__(self):
        return self.pname


