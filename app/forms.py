from django import forms
from django.forms import ModelForm
from .models import Category, Card

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
            'upper_category' : forms.Select(attrs={'class' : 'form-control'}),

        }

    def __init__(self, user=None, *args, **kwargs):
        super(ModelForm, self).__init__(*args,**kwargs)
        if user:
            self.fields['upper_category'].queryset = Category.objects.filter(creator=user)

class CardForm(ModelForm):
    class Meta:
        model = Card

        fields = ['question', 'answer', 'category']
             
        labels = {
            'question' : '',
            'answer' : '',
            'category' : ''
        }
        widgets = {
            'question' : forms.TextInput(attrs={'class' : 'form-control', 'placeholder' : 'Question'}),
            'answer' : forms.TextInput(attrs={'class' : 'form-control', 'placeholder' : 'answer'}),
            'category' : forms.Select(attrs={'class' : 'form-control'}),

        }