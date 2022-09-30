from django.db.models import Count
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect

from .models import CardAnswer, Category, Card, UserAttempt, UserCategory, AuthUser
from .forms import CategoryForm, CardForm

import random


def render_home(request):
    return render(request, "home.html")


def render_about(request):
    return render(request, "about.html")


def render_quiz_menu(request):
    return render(request, "quiz_menu.html")


def render_add_category(request):
    submitted = False
    if request.method == "POST":
        form = CategoryForm(request.user, None, request.POST)
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
    return render(request, "add_category.html", {'form': form, 'submitted': submitted})


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
    return render(request, "add_question.html", {'form': form, 'submitted': submitted})


def render_display_category(request):
    category_id = request.GET["category_id"]
    res = Category.objects.get(category_id=category_id)
    child_categorys = Category.objects.filter(upper_category=category_id)
    is_creator = request.user == res.creator
    return render(request, "display_category.html", {
        'res': res,
        'q_numb': Card.objects.filter(category=category_id).count(),
        'child_categorys': child_categorys,
        'is_creator': is_creator,
    })


def shuffle_cards(cards, n):
    cards = list(cards)
    random.shuffle(cards)
    cards = cards[:n]
    return cards


def get_user_category(id, category):
    auth_user = AuthUser.objects.get(id=id)
    try:
        user_category = UserCategory.objects.get(
            user=auth_user, category=category)
    except ObjectDoesNotExist:
        user_category = UserCategory(user=auth_user, category=category)
        user_category.save(force_insert=True)
    return user_category


def cards_numb_check(cards, cards_numb):
    if cards_numb > cards.count():
        cards_numb = cards.count()
    return cards_numb


def create_user_attempt(user_category, category_id):
    user_attempt = UserAttempt(
        user=user_category, user_category_id=category_id)
    user_attempt.save(force_insert=True)
    return user_attempt

def add_card_answers(post):
    attempt = UserAttempt.objects.get(
        user_attempt_id=int(post["attempt_id"]))
        
    all_answers = len(list(post.items())) - 2
    know_answers = 0
    for key, value in post.items():
        if key not in ("csrfmiddlewaretoken", "attempt_id"):
            if value == 'Y':
                know_answers += 1
            card = Card.objects.get(card_id=int(key))
            card_answer = CardAnswer(
                card=card, user_attempt_id=attempt, is_correct=value)
            card_answer.save(force_insert=True)

    return all_answers, know_answers

def render_display_question(request):
    if request.method == "POST":
        res = add_card_answers(request.POST)
        request.session['all_answers'] = res[0]
        request.session['know_answers'] = res[1]
        request.session['outcome'] = res[1] / res[0] * 100
        return redirect('quiz_result')

    if request.user.is_authenticated:
        category_id = request.GET["category_id"]
        cards_numb = int(request.GET["cards_numb"])
        cards = Card.objects.filter(category=category_id)
        cards_numb = cards_numb_check(cards, cards_numb)
        cards = shuffle_cards(cards, cards_numb)
        category = Category.objects.get(category_id=category_id)
        user_category = get_user_category(request.user.id, category)
        user_attempt = create_user_attempt(user_category, category_id)
        return render(request, "display_question.html", {
            'cards': cards,
            'category': category,
            'is_auth' : True,
            'user_attempt' : user_attempt
        })
    else:
        return render(request, "display_question.html", {
            'is_auth' : False
        })

def get_most_popular_cat():
    popular_cat_ids = UserCategory.objects.values('category_id').annotate(c=Count('category_id')).order_by("-c")
    popular_cat_ids = list(popular_cat_ids)
    popular_cat_ids = [id['category_id'] for id in popular_cat_ids]
    return Category.objects.filter(category_id__in = popular_cat_ids)

def render_quiz_menu(request):
    categories = Category.objects.order_by('-creation_date')
    if categories.count() > 5:
        newest_categories = categories[:5]
    else:
        newest_categories = categories
    popular_cat = get_most_popular_cat()
    return render(request, "quiz_menu.html", {
        'newest': newest_categories,
        'popular' : popular_cat
    })


def render_search_categories(request):
    if request.method == "POST":
        searched = request.POST["searched"]
        categories = Category.objects.filter(name__icontains=searched)
        return render(request, "search_categories.html", {
            'searched': searched,
            'categories': categories
        })
    else:
        return render(request, "search_categories.html", {

        })

def render_quiz_result(request):
    return render(request, "quiz_result.html", {})