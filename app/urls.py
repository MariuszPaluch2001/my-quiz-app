from django.urls import path
from app import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    path('', views.render_home, name="home"),
    path('about', views.render_about, name="about"),
    path('quiz_menu', views.render_quiz_menu, name="quiz_menu")
]

urlpatterns += staticfiles_urlpatterns()
