from django.db import models

# Create your models here.

class Goods(models.Model):
    name = models.CharField(max_length=200)
    platform = models.CharField(max_length=30)
    price = models.IntegerField()
    discount = models.FloatField()
    photo_url = models.CharField(max_length=200)
    link = models.CharField(max_length=200)
    create_date = models.DateField(auto_now_add=True)

    class Meta:
        db_table = 'product'
