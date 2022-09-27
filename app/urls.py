from django.urls import path
from app import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    path('', views.render_home, name="home"),
    path('about', views.render_about, name="about"),
    path('quiz_menu', views.render_quiz_menu, name="quiz_menu"),
    path('add_category', views.render_add_category, name="add_category"),
    path('add_question', views.render_add_question, name="add_question"),
    path('display_category', views.render_display_category, name="display_category"),
    path('display_question', views.render_display_question, name="display_question"),
    path('quiz_menu', views.render_quiz_menu, name="quiz_menu")
]

urlpatterns += staticfiles_urlpatterns()
