
from rest_framework import serializers
from member.models import Member

class MemberSerializers(serializers.ModelSerializer):

    class Meta:
        model = Member
        fields = ['id','name','sex','birthday','email','password','tel','address','verify','verufycode']
        #在sw
        extra_kwargs = {
            'password': {'write_only': True},
            'verify': {'write_only': True},
            'verufycode': {'write_only': True},
        }


