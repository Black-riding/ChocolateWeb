from django.test import TestCase

# Create your tests here.
from django.contrib.auth.hashers import make_password, check_password

class TestPasswordHashing(TestCase):  # ← 類別以 Test 開頭
    def test_make_password(self):     # ← 方法以 test_ 開頭
        raw_password = "aa"
        hashed = make_password(raw_password) #透過django自身模組裡面的make_password加密
        print(f"🔐 密碼測試: {hashed}\n")  # 印出加密後密碼

        # 驗證加密結果是否正確
        self.assertTrue(check_password(raw_password, hashed))