from django.shortcuts import render
from django.http import HttpResponseRedirect
from .forms import RegisterForm
# Create your views here.

def render_home(request):
    return render(request, "home.html")

def render_about(request):
    return render(request, "about.html")

def render_quiz_menu(request):
    return render(request, "quiz_menu.html")

def render_add_category(request):
    return render(request, "add_category.html")

def render_add_question(request):
    return render(request, "add_question.html")

def render_register(request):
    submitted = False
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/register?submitted=True')
    else:
        form = RegisterForm
        if 'submitted' in request.GET:
            submitted = True
    return render(request, "register_form.html", {'form' : form, 'submitted' : submitted})

def render_login(request):
    return render(request, "login_form.html")