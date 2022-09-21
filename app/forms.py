from django import forms
from django.forms import ModelForm
from .models import AppUser

class RegisterForm(ModelForm):
    #Temporary form for test. In future password hash will be realy password hash. :)
    class Meta:
        model = AppUser
        fields = ['login', 'password_hash']
        labels = {
            'login' : '',
            'password_hash' : ''
        }
        widgets = {
            'login' : forms.TextInput(attrs={'class' : 'form-control', 'placeholder' : 'login'}),
            'password_hash' : forms.TextInput(attrs={'class' : 'form-control', 'placeholder' : 'password'})

        }