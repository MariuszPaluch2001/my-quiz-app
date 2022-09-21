from django.contrib import admin
from .models import *

admin.site.register(AppUser)
admin.site.register(AuthUser)
admin.site.register(Card)
admin.site.register(CardAnswer)
admin.site.register(MultimediaAttach)
admin.site.register(UserAttempt)
admin.site.register(UserCategory)
admin.site.register(Category)
