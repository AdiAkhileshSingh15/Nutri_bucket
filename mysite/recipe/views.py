from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime
from recipe.models import Recipe, Recipe_prep_details, Contact
from django.views import generic
from django.views.generic import View

recipe_cards = [
	{
		'name': 'chocolate brownie',
	}, 
	{
		'name': 'cake',
	}
	]

# Create your views here.
def home(request):
	var = {
	'Recipe': Recipe.objects.all(),
	'Recipe_prep_details': Recipe_prep_details.objects.all(),
	'title': 'Home'
	}
	return render(request,'recipe/home.html', var)

def contact(request):
    if request.method == "POST":
        Name = request.POST.get('Name')
        Email=request.POST.get('Email')
        # phone = request.POST.get('phone')
        Message = request.POST.get('Message')
        contact = Contact(Name=Name, Email=Email,Message=Message,Date=datetime.today())
        contact.save()
    return render(request,'recipe/contact.html')

def about(request):
	return render(request,'recipe/about.html', {'title' : 'About'})

def signup(request):
    return render(request,'recipe/signup.html', {'title' : 'Sign Up'})

# def showrecipe(request):
#     name=Recipe.objects.values_list('Recipe_name')

# 	# return render(request,'recipe/recipe.html', {'title' : 'Recipe'} )

def veg(request):
    var1 = {
	'Recipe': Recipe.objects.all(),
	'Recipe_prep_details': Recipe_prep_details.objects.all(),
	'title': 'Veg'
	}
    return render(request,'recipe/Veg.html', var1)

def nonveg(request):
    var2 = {
	'Recipe': Recipe.objects.all(),
	'Recipe_prep_details': Recipe_prep_details.objects.all(),
	'title': 'Non-Veg'
	}
    return render(request,'recipe/Non-Veg.html', var2)

def vegan(request):
    var3 = {
	'Recipe': Recipe.objects.all(),
	'Recipe_prep_details': Recipe_prep_details.objects.all(),
	'title': 'Vegan'
	}
    return render(request,'recipe/Vegan.html', var3)

def bakery(request):
    var4 = {
	'Recipe': Recipe.objects.all(),
	'Recipe_prep_details': Recipe_prep_details.objects.all(),
	'title': 'Bakery'
	}
    return render(request,'recipe/Bakery.html', var4)

class recipedetail(generic.DetailView):
	model = Recipe
	template_name='recipe/recipe.html'

# def recipedetail(request):
# 	my_recipe = Recipe.objects.filter()

# 	context = {'Recipe_description': my_recipe.Recipe_description}
# 	return render(request,'recipe/recipe.html', context)
