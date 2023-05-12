from django.contrib import admin
from recipe.models import Recipe, Recipe_prep_details, Nutri_content, Contact
# Register your models here.
admin.site.register(Recipe)
admin.site.register(Recipe_prep_details)
admin.site.register(Nutri_content)
admin.site.register(Contact)