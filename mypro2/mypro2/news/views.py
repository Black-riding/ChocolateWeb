from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.

def news(request):
    return render(request,'news.html')
