"""ITW2 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='recipe-home'),
    path('contact', views.contact, name='recipe-contact'),
    path('about/', views.about, name='recipe-about'),
    path('signup/', views.signup, name='recipe-signup'),
    path('<int:pk>/', views.recipedetail.as_view(), name='Recipedetail'),
    path('Veg/', views.veg, name='Veg'),
    path('Non-Veg/', views.nonveg, name='Non-Veg'),
    path('Vegan/', views.vegan, name='Vegan'),
    path('Bakery/', views.bakery, name='Bakery'),
    # path('<int:pk>/',views.recipedetail.as_view(), name='Recipedetail')
]
