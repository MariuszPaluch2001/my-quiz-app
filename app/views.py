from django.shortcuts import render

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
    return render(request, "register_form.html")

def render_login(request):
    return render(request, "login_form.html")