from django.test import TestCase

# Create your tests here.

import pytest
from cart.models import OrderModel, DetailModel
from rest_framework.test import APIClient

@pytest.mark.django_db #在測試執行完畢後，清除所有資料、甚至整個資料庫都刪掉
def test_cart_api_returns_product_and_customer():
    #創建客戶資料
    order = OrderModel.objects.create(
        customname="王小明",
        customemail="test@example.com",
        customphone="0912345678",
        customaddress="台北市信義區仁愛路",
        paytype="信用卡",
        paymentype="一次付清"
    )
    #創建訂單資料
    DetailModel.objects.create(
        dorder=order,
        pname="紅葡萄酒香巧克力",
        unitprice=750,
        quantity=2,
        dtotal=1500
    )

    client = APIClient() #創建了一個 APIClient 來模擬發送 HTTP 請求
    response = client.get("/Cartapi/Cart/") #這個請求會向 /Cartapi/Cart/ 發送 GET 請求。這個 API 應該返回一個包含所有購物車細節的 JSON 資料。
    #/Cartapi/Cart/路徑是由mypro2/urls/裡面取得Cartapi和app檔案(cart)裡面的urls裡面取得Cart這兩串路徑的結合
    assert response.status_code == 200 #驗證 API 回應 200表示成功
    data = response.json() #將回應的 JSON 內容轉換成 Python 字典（或列表），以便後續的檢查。
    assert data[0]["pname"] == "紅葡萄酒香巧克力" #檢查回傳訊息是否正確
    assert data[0]["customer"]["customname"] == "王小明"

# 測試：沒有任何訂單資料時，API 應該回傳空列表
@pytest.mark.django_db
def test_cart_api_returns_empty_when_no_data():
    client = APIClient()
    response = client.get("/Cartapi/Cart/")
    assert response.status_code == 200
    assert response.json() == []

# 測試：錯誤 URL 應回傳 404
@pytest.mark.django_db
def test_cart_api_invalid_url():
    client = APIClient()
    response = client.get("/Cartapi/Invalid/")
    assert response.status_code == 404