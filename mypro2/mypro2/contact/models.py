from django.db import models

# Create your models here.
class myMessage(models.Model):
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    subject = models.CharField(max_length=50)
    content = models.TextField(blank=True,null=True)
    create_date = models.DateField(auto_now_add=True)
    response = models.TextField(blank=True,null=True)

    class Meta:
        db_table="contact"
