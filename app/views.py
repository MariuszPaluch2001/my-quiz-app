from django.shortcuts import render

# Create your views here.

def render_home(request):
    return render(request, "home.html")

def render_about(request):
    return render(request, "about.html")

def render_quiz_menu(request):
    return render(request, "quiz_menu.html")