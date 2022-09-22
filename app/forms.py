from django import forms
from django.forms import ModelForm
from .models import Category, AppUser

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
        