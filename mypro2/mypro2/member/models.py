from django.db import models

# Create your models here.

class Member(models.Model):
    name = models.CharField(max_length=100)
    sex = models.CharField(max_length=2)
    birthday = models.DateField()
    email = models.EmailField(max_length=100)
    password = models.CharField(max_length=100)
    tel = models.CharField(max_length=30)
    address = models.CharField(max_length=100)
    # 驗證碼
    verify = models.IntegerField(default=0)  # default=0 預設為0
    verufycode = models.CharField(max_length=10)

    class Meta:
        db_table = "associator"  # mysql8.0 裡面 member是關鍵字


