from django.db import models

# Create your models here.
class User(models.Model):
    login = models.CharField('user_login', max_length=30)
    password_hash = models.CharField('user_pasword_hash', max_length=300)
    creation_date = models.DateField('user_date_creation')