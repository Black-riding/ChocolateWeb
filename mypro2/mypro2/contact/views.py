from django.shortcuts import render

# Create your views here.

from .models import myMessage

def contact(request):
    if 'username' in request.POST:
        name = request.POST['username']
        email = request.POST['email']
        subject = request.POST['subject']
        content = request.POST['content']

        obj = myMessage.objects.create(name=name,email=email,subject=subject,content=content)

        obj.save()

    data = myMessage.objects.all().order_by("-id")

    return render(request,'contact.html',locals())
