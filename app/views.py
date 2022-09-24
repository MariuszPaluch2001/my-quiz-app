from django.shortcuts import render
from django.http import HttpResponseRedirect
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
