from django import forms
from django.forms import ModelForm
from django.forms import modelformset_factory
from .models import CardAnswer, Category, Card

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

    def __init__(self, user=None, upper_category_initial = None ,*args, **kwargs):
        super(ModelForm, self).__init__(*args,**kwargs)
        if user:
            self.fields['upper_category'].queryset = Category.objects.filter(creator=user)
        if upper_category_initial:    
            self.initial['upper_category'] = Category.objects.get(category_id = upper_category_initial)

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

    def __init__(self, user=None, category_initial = None, *args, **kwargs):
        super(ModelForm, self).__init__(*args,**kwargs)
        if user:
            self.fields['category'].queryset = Category.objects.filter(creator=user)
        if category_initial:    
            self.initial['category'] = Category.objects.get(category_id = category_initial)


# class CardAnswerForm(ModelForm):
#     CHOICES = [ ('Y','Yes'), ('N', 'No')]
#     response = forms.ChoiceField(widget=forms.RadioSelect,choices=CHOICES)

#     def __init__(self, card : Card, *args, **kwargs):
#         super(ModelForm, self).__init__(*args,**kwargs)
        

#     class Meta:
#         model = CardAnswer
