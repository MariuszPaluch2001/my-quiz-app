from django.urls import path
from app import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    path('', views.render_home, name="home"),
    path('about', views.render_about, name="about"),
    path('quiz_menu', views.render_quiz_menu, name="quiz_menu"),
    path('add_quiz', views.render_add_quiz, name="add_quiz"),
    path('add_question', views.render_add_question, name="add_question"),
    
]

urlpatterns += staticfiles_urlpatterns()
