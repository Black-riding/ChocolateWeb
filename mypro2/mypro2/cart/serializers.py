from rest_framework import serializers #序列化
from cart.models import DetailModel,OrderModel


class memberSerializers(serializers.ModelSerializer):

    class Meta:
        model = OrderModel
        fields = ['customname','customphone','customaddress','customemail','create_date','paytype']

class cartSerializers(serializers.ModelSerializer):
    customer = serializers.SerializerMethodField()  # 添加了 會員(customer)欄位

    class Meta:
        model = DetailModel
        fields = ['pname', 'unitprice', 'quantity', 'dtotal', 'customer']

    def get_customer(self, obj):
        order = obj.dorder
        if order:
            return memberSerializers(order).data
        return None