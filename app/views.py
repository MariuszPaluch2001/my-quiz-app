from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render
from django.http import HttpResponseRedirect

from .models import Category, Card, UserAttempt, UserCategory, AuthUser
from .forms import CategoryForm, CardForm

import random

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
        form = CategoryForm(request.user,None, request.POST)
        if form.is_valid():
            thought = form.save(commit=False)
            thought.creator = request.user
            thought.save()
            return HttpResponseRedirect('/add_category?submitted=True')
    else:
        if 'category_id' in request.GET:
            form = CategoryForm(request.user, request.GET["category_id"])
        else:
            form = CategoryForm(request.user)
        if 'submitted' in request.GET:
            submitted = True
    return render(request, "add_category.html", {'form' : form, 'submitted' : submitted})

def render_add_question(request):
    submitted = False
    if request.method == "POST":
        form = CardForm(request.user, None, request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/add_question?submitted=True')
    else:
        if 'category_id' in request.GET:
            form = CardForm(request.user, request.GET["category_id"])
        else:
            form = CardForm(request.user)
        if 'submitted' in request.GET:
            submitted = True
    return render(request, "add_question.html", {'form' : form, 'submitted' : submitted})

def render_display_category(request):
    category_id = request.GET["category_id"]
    res = Category.objects.get(category_id= category_id)
    child_categorys = Category.objects.filter(upper_category = category_id)
    is_creator = request.user == res.creator
    return render(request, "display_category.html", {
        'res' : res, 
        'q_numb' : Card.objects.filter(category = category_id).count(), 
        'child_categorys' : child_categorys,
        'is_creator' : is_creator,
    })

def shuffle_cards(cards, n):
    cards = list(cards)
    random.shuffle(cards)
    cards = cards[:n]
    return cards

def get_user_category(id, category):
    auth_user = AuthUser.objects.get(id = id)
    try:
        user_category = UserCategory.objects.get(user = auth_user, category = category)
    except ObjectDoesNotExist:
        user_category = UserCategory(user = auth_user, category = category)
        user_category.save(force_insert=True)
    return user_category


def render_display_question(request):
    category_id = request.GET["category_id"]
    cards_numb = int(request.GET["cards_numb"])
    cards = Card.objects.filter(category = category_id)
    if cards_numb > cards.count():
        cards_numb = cards.count()
    cards = shuffle_cards(cards, cards_numb)
    category = Category.objects.get(category_id = category_id)
    user_category = get_user_category(request.user.id, category)
    user_attempt = UserAttempt(user = user_category, user_category_id = category_id)
    user_attempt.save(force_insert=True)
    return render(request, "display_question.html",{
        'cards' : cards,
        'category' : category
    })

def render_quiz_menu(request):
    categories = Category.objects.order_by('-creation_date')
    if categories.count() > 5:
        newest_categories = categories[:5]
    else:
        newest_categories = categories
    return render(request, "quiz_menu.html", {
        'newest': newest_categories
    })

def render_search_categories(request):
    if request.method == "POST":
        searched = request.POST["searched"]
        categories = Category.objects.filter(name__icontains = searched)
        return render(request, "search_categories.html", {
            'searched' : searched,
            'categories' : categories
        })
    else:
        return render(request, "search_categories.html", {

        })