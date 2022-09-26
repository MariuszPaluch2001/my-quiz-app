from django.shortcuts import render
from django.http import HttpResponseRedirect

from .models import Category, Card
from .forms import CategoryForm, CardForm

# Create your views here.

def render_home(request):
    return render(request, "home.html")

def render_about(request):
    return render(request, "about.html")

def render_quiz_menu(request):
    return render(request, "quiz_menu.html")

def render_add_category(request):
    submitted = False
    if request.method == "POST":
        form = CategoryForm(request.user, request.POST)
        if form.is_valid():
            thought = form.save(commit=False)
            thought.creator = request.user
            thought.save()
            return HttpResponseRedirect('/add_category?submitted=True')
    else:
        form = CategoryForm(request.user)
        if 'submitted' in request.GET:
            submitted = True
    return render(request, "add_category.html", {'form' : form, 'submitted' : submitted})

def render_add_question(request):
    submitted = False
    if request.method == "POST":
        form = CardForm(request.user, request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/add_question?submitted=True')
    else:
        form = CardForm(request.user)
        if 'submitted' in request.GET:
            submitted = True
    return render(request, "add_question.html", {'form' : form, 'submitted' : submitted})

def render_display_category(request):
    category_id = request.GET["category_id"]
    res = Category.objects.get(category_id= category_id)
    questions_numb = len(tuple(Card.objects.filter(category = category_id)))
    child_categorys = Category.objects.filter(upper_category = category_id)
    is_creator = Category.objects.filter(creator= request.user)
    return render(request, "display_category.html", {
        'res' : res, 
        'q_numb' : questions_numb, 
        'child_categorys' : child_categorys,
        'is_creator' : is_creator    
    })