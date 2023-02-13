from django.db import models

class Student(models.Model):
    firstname = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    contact = models.IntegerField()
    age = models.IntegerField()
    email = models.CharField(max_length=30)
# Create your models here.
