from django.urls import path
from cart.views import ArticleListCreateAPIView,ArticleDetailAPIView



urlpatterns = [
    path('articles/', ArticleListCreateAPIView.as_view(), name='article-list-create'),
    path('articles/<int:pk>/', ArticleDetailAPIView.as_view(), name='article-detail'),
]

