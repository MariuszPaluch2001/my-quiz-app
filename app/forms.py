from django import forms
from django.forms import ModelForm
from .models import AppUser, Category

class RegisterForm(ModelForm):
    #Temporary form for test. In future password hash will be realy password hash. :)
    class Meta:
        model = AppUser
        fields = ['email','login', 'password_hash']
        labels = {
            'email' : '',
            'login' : '',
            'password_hash' : ''
        }
        widgets = {
            'email' : forms.TextInput(attrs={'class' : 'form-control', 'placeholder' : 'email'}),
            'login' : forms.TextInput(attrs={'class' : 'form-control', 'placeholder' : 'login'}),
            'password_hash' : forms.TextInput(attrs={'class' : 'form-control', 'placeholder' : 'password'})

        }

class CategoryForm(ModelForm):
    class Meta:
        model = Category

        fields = ['name', 'upper_category']
             
        labels = {
            'name' : '',
            'upper_category' : ''
        }
        widgets = {
            'name' : forms.TextInput(attrs={'class' : 'form-control', 'placeholder' : 'Category name'}),

        }
        