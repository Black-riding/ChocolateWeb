
from rest_framework import serializers #序列化
from product.models import Goods

class GoosdsSerializers(serializers.ModelSerializer):

    class Meta:
        model = Goods
        fields = '__all__'



