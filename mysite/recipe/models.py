from django.contrib.auth.models import User
from django.db import connections, models
from django.urls import reverse


class Recipe(models.Model):
	Recipe_id = models.AutoField(primary_key=True)
	Recipe_name = models.CharField(max_length=100)
	Recipe_description = models.TextField()
	Recipe_type = models.CharField(max_length=100)
	Recipe_category = models.CharField(max_length=100)
	def get_absolute_url(self):
		return reverse('recipe:RecipeDetail', kwargs={'pk': self.pk})
	
	class Meta:
		db_table="recipes"

class Recipe_prep_details(models.Model):
	Recipe = models.OneToOneField(Recipe, on_delete=models.CASCADE, primary_key=True)
	preparation_time = models.CharField(max_length=100)
	num_of_servings = models.IntegerField()
	ingredients = models.TextField()
	instructions = models.TextField()

	class Meta:
		db_table="recipe_prep_details"

	def __str__(self):
		return str(self.Recipe.Recipe_name)


class Nutri_content(models.Model):
	Recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE, primary_key=True)
	calories_per_serving = models.CharField(max_length=100)
	carbs = models.CharField(max_length=100)
	proteins = models.CharField(max_length=100)
	saturated_fats = models.CharField(max_length=100)
	trans_fats = models.CharField(max_length=100)
	cholestrol = models.CharField(max_length=100)

	class Meta:
		db_table="nutri_content"

	def __str__(self):
		return str(self.Recipe_id)

class Contact(models.Model):
    Name = models.CharField(max_length=122,primary_key=True)
    Email=models.CharField(max_length=122)
    # phone = models.CharField(max_length=12)
    Message = models.TextField()
    Date = models.DateField()

    class Meta:
        db_table="contacts"

    def __str__(self):
        return self.Name