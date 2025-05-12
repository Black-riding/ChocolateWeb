from django.contrib import admin

# Register your models here.
from .models import myMessage

class MessageAdmin(admin.ModelAdmin):
    list_display = ('subject','email')

admin.site.register(myMessage,MessageAdmin)