from django.urls import path,include
from rest_framework import routers
from cart.views import CartViewSet

router = routers.DefaultRouter()#建立 路由器
# 註冊 網址 視圖
#127.0.0.1:8000/api/Goods 會對應到 GoodsViewSet 類別
router.register(r'Cart', CartViewSet) #rais=原生字串


urlpatterns = [
    path('',include(router.urls)),
]