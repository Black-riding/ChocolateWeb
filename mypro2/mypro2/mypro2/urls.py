"""
URL configuration for mypro2 project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include


#關於我們
from about.views import about
#消息
from news.views import news
#商品
from product.views import product, GoodsViewSet #GoodsViewSet,
#聯絡我們
from contact.views import contact
#會員
from member.views import register,login,logout,changePwd
#購物車
from cart.views import addtocart,cart,cartorder,cartok,cartordercheck,myorder,reportBank,bankfiveok,ECPayCredit,ecpsuccess,returnok
# Swagger
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
   openapi.Info(
      title="Swagger API",
      default_version='v1',
      description="Swagger API 文件",
   ),
   public=True,
   permission_classes=(permissions.AllowAny,),
)


urlpatterns = [
    path('admin1/', admin.site.urls),
    #關於我們
    path('about/',about),
    #最新消息
    path('',news),
    path('news/',news),
    #產品
    path('product/',product),
    #聯絡我們
    path('contact/',contact),
    #會員
    path('register/',register),
    path('login/',login),
    path('logout/',logout),
    path('changePwd/',changePwd),
    #購物車
    path('cart/',cart),
    path('addtocart/<str:ctype>/<int:productid>/',addtocart),
    path('addtocart/<str:ctype>/',addtocart),
    path('cartok/',cartok),
    path('cartorder/',cartorder),
    path('cartordercheck/',cartordercheck),
    path('myorder/',myorder),
    path('reportBank/',reportBank),
    path('bankfiveok/',bankfiveok),
    path('creditcard/',ECPayCredit),
    path('ecpsuccess/',ecpsuccess),
    #API
    path('Goodsapi/', include('product.urls')),
    path('Memberapi/',include('member.urls')),
    path('Cartapi/',include('cart.urls')),
    path('Swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),


]
