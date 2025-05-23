# Generated by Django 4.2.20 on 2025-05-09 15:31

from django.db import migrations

def copy_verufy_to_verify(apps, schema_editor):
    Member = apps.get_model('member', 'Member')
    for member in Member.objects.all():
        member.verify = member.verufy
        member.save()

class Migration(migrations.Migration):

    dependencies = [
        ('member', '0002_member_verify'),
    ]

    operations = [
        migrations.RunPython(copy_verufy_to_verify),
    ]
