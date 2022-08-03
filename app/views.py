from django.shortcuts import render

# Create your views here.

def hello_world_test(request):
    return render(request, "hello.html")