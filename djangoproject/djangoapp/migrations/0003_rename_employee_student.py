# Generated by Django 4.1.3 on 2023-02-04 17:41

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('djangoapp', '0002_employee_email'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Employee',
            new_name='Student',
        ),
    ]
