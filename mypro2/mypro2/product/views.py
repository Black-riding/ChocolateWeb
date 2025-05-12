from django.shortcuts import render

# Create your views here.

from .models import Goods
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
#API ReadOnlyModelViewSet(只有查詢功能)
from rest_framework.viewsets import ReadOnlyModelViewSet
from product.serializers import GoosdsSerializers
#ModelViewSet(有完整CRUD（查詢、新增、修改、刪除）功能)
from rest_framework.viewsets import ModelViewSet


def product(request):
    # .order_by("-price")遞減排序

    data = Goods.objects.all().order_by("price")

    key = ""
    lowprice = ""
    highprice = ""

    if 'prokey' in request.GET:  # 查詢系統

        key = request.GET['prokey']
        lowprice = request.GET['lowprice']
        highprice = request.GET['highprice']

        if len(key) > 0 and len(lowprice) == 0 and len(highprice) == 0:
            data = Goods.objects.filter(name__icontains=key).order_by('price')
        elif len(key) == 0 and len(lowprice) > 0 and len(highprice) > 0:
            data = Goods.objects.filter(price__gte=lowprice, price__lte=highprice).order_by('price')
        elif len(key) > 0 and len(lowprice) > 0 and len(highprice) > 0:
            data = Goods.objects.filter(name__icontains=key, price__gte=lowprice, price__lte=highprice).order_by(
                'price')
        else:
            data = Goods.objects.all().order_by('price')
    else:
        data = Goods.objects.all().order_by('price')

    paginator = Paginator(data, 50)  # 50頁為一筆
    page = request.GET.get('page')

    try:
        data = paginator.page(page)
    except PageNotAnInteger:
        data = paginator.page(1)

    except EmptyPage:
        data = paginator.page(paginator.num_pages)

    return render(request, "product.html", locals())

class GoodsViewSet(ModelViewSet):
    queryset = Goods.objects.all()
    serializer_class = GoosdsSerializers


