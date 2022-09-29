from django.db import models
from django.contrib.auth.models import User

# class AppUser(models.Model):

#     user_id = models.DecimalField(primary_key=True, max_digits=4, decimal_places=0)
#     login = models.CharField(unique=True, max_length=30)
#     creation_date = models.DateField()
#     auth_user = models.OneToOneField(User, null=True, on_delete = models.CASCADE)

#     class Meta:
#         managed = False
#         db_table = 'app_user'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'

    def __str__(self):
        return self.username

class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Card(models.Model):
    card_id = models.DecimalField(primary_key=True, max_digits=6, decimal_places=0)
    question = models.CharField(max_length=200)
    answer = models.CharField(max_length=500)
    category = models.ForeignKey('Category', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'card'
    
    def __str__(self) -> str:
        return self.question


class CardAnswer(models.Model):
    solution_timestamp = models.DateTimeField()
    card = models.ForeignKey(Card, models.DO_NOTHING)
    return_time = models.OneToOneField('UserAttempt', models.DO_NOTHING, db_column='return_time', primary_key=True)
    user_id = models.DecimalField(max_digits=4, decimal_places=0)
    user_category_id = models.DecimalField(max_digits=5, decimal_places=0)
    is_correct = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'card_answer'
        unique_together = (('return_time', 'user_id', 'user_category_id', 'card', 'solution_timestamp'),)


class Category(models.Model):
    category_id = models.DecimalField(primary_key=True, max_digits=5, decimal_places=0)
    name = models.CharField(max_length=50)
    creation_date = models.DateField()
    creator = models.ForeignKey(User, models.DO_NOTHING)
    upper_category = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'category'

    def __str__(self) -> str:
        return self.name

class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class MultimediaAttach(models.Model):
    attach_id = models.DecimalField(primary_key=True, max_digits=5, decimal_places=0)
    attachment = models.BinaryField()
    card = models.ForeignKey(Card, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'multimedia_attach'

class UserAttempt(models.Model):
    attempt_id = models.AutoField(primary_key=True)
    return_time = models.DateTimeField(auto_now=True)
    user = models.OneToOneField('UserCategory', models.DO_NOTHING)
    user_category_id = models.DecimalField(max_digits=5, decimal_places=0)
    
    class Meta:
        managed = False
        db_table = 'user_attempt'
        unique_together = (('user', 'user_category_id', 'return_time'),)

class UserCategory(models.Model):
    category = models.ForeignKey(Category, models.DO_NOTHING)
    user = models.OneToOneField(AuthUser, models.DO_NOTHING, primary_key=True)

    class Meta:
        managed = False
        db_table = 'user_category'
        unique_together = (('user', 'category'),)
