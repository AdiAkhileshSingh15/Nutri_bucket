show databases;
-- drop database if exists Recipe_site;
create database if not exists Recipe_site;
use Recipe_site;

create table if not exists Users
( usr_name varchar(255) not null,
usr_id varchar(255) not null,
usr_pswd varchar(255) not null,
usr_level varchar(255) not null,
primary key (usr_id)
);
select * from users;


create table if not exists Recipes
( Recipe_id int not null auto_increment, 
Recipe_Name varchar(255) not null,
Recipe_description varchar(2000),
Recipe_Type varchar(255) not null, /*veg, non-veg, egg, vegan*/
Recipe_Category varchar(255) not null,
primary key (Recipe_id)
);

create table if not exists upload_details
( usr_id varchar(255),
usr_name varchar(255),
date_uploaded datetime,
foreign key (usr_id) references users (usr_id)
);

alter table upload_details
add recipe_id int;
select * from upload_details;


create table if not exists user_details
( usr_id varchar(255),
height_cm int,
weight_kg int,
foreign key (usr_id) references users (usr_id)
);
select * from user_details;


create table if not exists recipe_prep_details
( recipe_id int not null auto_increment,
preparation_time time,
num_of_servings int,
ingredients varchar(2000),
instructions varchar(2000),
foreign key (recipe_id) references recipes(recipe_id)
);

-- alter table recipe_prep_details
-- add recipe_id int;
alter table recipe_prep_details
add constraint foreign key (recipe_id) references recipes (recipe_id);
 
select * from recipe_prep_details;

create table if not exists nutri_content         
( 
calories_per_serving decimal,
carbs decimal,
proteins decimal,
saturated_fats decimal,
trans_fats decimal,
cholestrol decimal
);
alter table nutri_content
add column recipe_id int;
alter table nutri_content
add foreign key (recipe_id) references recipes (recipe_id);

select * from nutri_content;

show tables;
select * from Recipes;

select * from recipe_prep_details;

/* 1 */
insert into recipes values
(1,'Kadai Paneer','Kadai Paneer is a versatile curry dish that is famous in North Indian cuisine. It involves cooking paneer in a Kadhai or wok and dressing it in thick and creamy gravy.','Veg','Meal' );

insert into recipe_prep_details VALUES(1,20,1,
'Cashewnut (2 Piece Split)
Watermelon Seeds- 1teaspoon
Refined Oil- 1.5 teaspoons
Salt- 0.75 teaspoons
Turmeric Powder- 1 pinch
Red Chilli Powder(kashmiri)-1 pinch
Red Dry Chilli Bydagi- 0.5 unit
Coriander Seeds- 1 pinch
Fennel Seeds- 1 pinch
Cumin- 0.5 teaspoons
Cinnamon Sticks- 0.25 unit
Garam Masala- 1 pinch
Tomato Puree- 2 teaspoons
Ginger Garlic Paste- 1.5 teaspoons
Onion- 0.5 cups
Tomato- 0.25 cups
Capsicum Green-regular-1 small piece
Capsicum Yellow (regular)-1 small piece
Capsicum Red-regular-1 small piece
Paneer- 1 cup
Green Chillies- 1 unit
Garlic- 1 piece
Coriander Leaves- 2 leafs', 
'1. In a bowl, add Water, Cashew, Magaz and keep aside for 1 hr soaking.
2.  In a heavy bottom vessels add Water, soaked Cashew, Magaz and bring to boil.
3. In a blender, add boiled Cashew, Magaz and make a fine puree.
4. Heat Oil in a pan. Add Ginger Garlic Paste and saute.
5. Add chopped Onion, Salt and Saute till brown.
6. Add Turmeric Powder, Red Chilli Powder and cook for one minute.
7. Add chopped Tomatoes and cook till mushy and gravy become thick. Remove to a bowl and keep aside.
8. Heat a pan, add Bydagi Chilli, Coriander Seeds, Fennel Seeds, Cumin Seeds, Cinnamon Stick and toss till fragrant.
9. In a blender, add above toss Bydagi Chilli, Coriander Seeds, Fennel Seeds, Cumin Seeds, Cinnamon Sticks and make a fine powder. Keep aside.
10. Heat Oil in a pan. Add diced shaped Onion, Red Pepper, Yellow Pepper, Green Pepper, Salt and saute for sometime and keep aside.
11. Heat Oil in a pan. Add Cumin Seed, chopped Garlic, Green Chilli, Ginger Garlic Paste and saute till golden.
12. Add Onion Tomato Masala, Garam Masala, Kadai Masala and cook for few mins.
13. Add Melon and Cashew Paste, Tomato Puree and cook.
14. Add diced Paneer, Sautéed Peppers, Onions and cook for some time.
15. Remove to a bowl garnish with chopped Coriander and serve hot.');

insert into nutri_content values(
257,16,14,15,15,10,1
);
select * from nutri_content;

insert into users values(
'Adi', '01','abcde','super-user');

insert into user_details values(
'01',164,50);

insert into upload_details values(
'01','Adi','2022-10-25 17:23:16' ,1
);

select * from users;
select * from  user_details;
select * from  upload_details;
select * from nutri_content;
select * from recipe_prep_details;
select * from recipes;

insert into users values(
'Sameeksha', '02','qwerty','super-user');

insert into user_details values(
'02',169,60);

insert into upload_details values(
'02','Sameeksha','2022-10-25 18:20:11' ,2
);


insert into users values(
'Ujjawal Modi', '03','asdfg','normal-user');

insert into user_details values(
'03',175,65);

insert into upload_details values(
'03','Ujjawal Modi','2022-09-26 13:23:11' ,3
);


insert into users values(
'Tejas More', '04','1234abc','normal-user');

insert into user_details values(
'04',155,50);

insert into upload_details values(
'04','Tejas More','2022-09-26 14:21:59' ,3
);

insert into users values(
'Krishna Madhwani', '05','46541bshgx','normal-user');

insert into user_details values(
'05',155,60);

insert into upload_details values(
'05','Krishna Madhwani','2022-09-26 14:21:59' ,4
);


-- delete from users
-- where usr_id = '03';



/* 2 */
insert into recipes values(
2,'Chilli Paneer','Chilli Paneer is one of those delicacies kids and family members crave for from time to time. Be it at a wedding party, school event or a rainy evening, a piping hot bowl of chilli paneer is enough to light up smiles on faces.', 'Veg', 'Chinese Starter' );

insert into recipe_prep_details values(
2, 25, 2,
'Atta- 2 tablespoons
Salt- 1 teaspoon
Light Soy Sauce- 1 teaspoon
Jaggery Powder- 1 teaspoon
Red Dry Chilli Bydagi- 6 pieces
Dark Soy Sauce- 1 teaspoon
Corn Flour- 1 tablespoon
Apple Cider Vinegar- 1 teaspoon
Paneer- 200 g
Ginger- 2 teaspoons
Onion- 1 unit
Spring Onion- 6 g
Capsicum Green-regular- 0.5 unit
Capsicum Red-regular- .5 unit
Rice Flour- 2 tablespoons
Pepper- 0.5 teaspoons
Garlic- 10 g
Green Chillies- 2 units
Water- 0.5 cups',
'1. Fine chop the garlic, ginger, spring onions and green chilli. Set aside. Cut the paneer into cubes. Cut the onion, green capsicum, red bell pepper into small triangles. Set aside.
2. Marinate the paneer in chopped ginger, chopped garlic, soy sauce and a pinch of salt. Mix well and let it rest for 5 min.
3. In the meantime, in a mixing bowl add salt, black pepper crushed, whole wheat flour, rice flour, cornflour, and 2 tablespoon water to combine all the ingredients and make a thick batter. Add marinated paneer and mix to evenly coat.
4. Preheat the oven at 180 degrees c. Grease a baking tray with a little oil and arrange the marinated, batter coated paneer dices. Bake it for 10 minutes at 180 degrees C or until it turns golden brown and crispy. Keep it aside.
5. Soak the dry red chilli in warm water for 15 minutes and drain the water. Blend to make a fine paste. Cook the chilli paste in 1 teaspoon of oil until it turns thick and is cooked through. Set aside.
6. Heat the oil in a pan or wok over a medium flame. Add chopped garlic, ginger, green capsicum, red bell pepper and saute for a few seconds. Now add the cut onions. Stir-fry till the capsicum have partially cooked but are still crunchy. Add green chilli , chilli paste and cook well and for a few minutes. Then add some water and stir it. Cook till the oil separates.
7. Add apple cider vinegar, soy sauce, jaggery powder, salt, and a pinch of black pepper powder. Mix well and check seasoning. The sauce should be of coating consistency. Add the crispy paneer to a pan and add an appropriate amount of sauce.
8. Toss to evenly coat and combine. Check seasoning
9. Garnish with chopped spring onion greens and serve.');

insert into nutri_content values(
408,42,23,8,8,101,2);

/* 3 */
insert into recipes values(
3,'Chocolate Marble cake','
It is a cake with a streaked or mottled appearance (like marble) achieved by very lightly blending light and dark batter. It tastes even better when accompanied with a beverage to fulfill your evening hunger with this.', 'Egg', 'Bakery');

insert into recipe_prep_details values(
3,55,16,'
Baking spray with flour
1 2/3 cups all-purpose or cake flour
2/3 cup whole-wheat pastry flour
1 1/2 teaspoons baking powder
1/2 teaspoon baking soda
1/4 teaspoon salt
1 cup plus 1 tablespoon sugar, divided
1 cup light sour cream
1/2 cup plain almond milk
1/2 cup applesauce
1/3 cup melted unsalted butter
2 eggs
2 egg whites
1 1/2 teaspoons pure vanilla extract
1 ounce unsweetened chocolate, melted
1 tablespoon unsweetened cocoa powder
Glaze:
1/2 cup powdered sugar
1 tablespoon melted unsalted butter
1 tablespoon warm water
1 tablespoon unsweetened cocoa', 
'
1. Preheat oven to 350°. Coat a 10-inch Bundt cake pan with spray.
2. Combine flours, baking powder, baking soda, salt, and 1 cup sugar in a large bowl.
3. Whisk next 7 ingredients (through vanilla) in another large bowl until blended. Add to the dry ingredients and stir with a spatula until just combined. Transfer 3/4 cup batter to a small bowl and whisk in chocolate, cocoa, and remaining 1 tablespoon sugar. Pour 3 cups white batter into prepared pan. Dollop chocolate batter over white batter; cover with remaining white batter. Using a knife, swirl batter once in a continuous S-shape around pan.
4. Bake 55 minutes, until a skewer inserted in the center comes out clean. Cool in pan 10 minutes; invert onto rack and cool completely.
5. In a bowl, combine glaze ingredients and drizzle over cake. Serve.');

insert into nutri_content values(
219,34,4,4.4,2,44,3);

/* 4 */
insert into recipes value(
4,'Chocolate Chip Cookies','People love gorging on crunchy, chewy cookies and if it is made using vegan ingredients, it becomes a healthier recipe that can be enjoyed while being mindful of your health. Vegan Chocolate Chip Cookies is an easy to make and delightful recipe.','Bakery','Veg');

/*
update recipes
set Recipe_Type = 'Veg',Recipe_Category = 'Bakery'
where Recipe_id = 4;
*/
insert into recipe_prep_details value(
4,'01:00',13,
'
Atta- 1.25 cups
Baking Powder- 1 teaspoon
Salt- 0.5 teaspoons
Jaggery Powder- 80 g
Coconut Oil- 0.5 cups
Dark Chocolate- 125 g
Baking Soda- 0.75 teaspoons
Water- 0.25 cups'
, '
1. Chop the chocolate into tiny chunks the size of chocolate chips and set aside. Combine the whole wheat flour, baking powder, baking soda and salt in a bowl.
2. In a separate bowl, take water, oil, jaggery powder and whisk until the jaggery is dissolved.
3. Gradually add the dry mixture to the wet and mix with a spatula. Add chopped chocolate and mix.
4. Freeze the dough in the fridge for half hour (this is done to give the doug stability, as at room temperature the fat in the cookie tends to melt)
5. Preheat the oven when the dough is being refrigerated. Time it in a way that when it is time to remove the dough, the oven is just done preheating. Grease the baking tray with a bit of oil. Take the dough out once cooled, make even round balls with your hands and flatten them slightly on your baking tray. You might feel the butter melting due to the heat of your palms so you might want to be a bit quick about this process. Bake it for 12-14 min at 180c.
6. Let the cookies cool down on a rack . Enjoy the cookies while they are warm.');

insert into nutri_content values(
290,26,3,8,9,40,4 );

/* 5 */
insert into recipes value(
5,'High-Protein Quinoa Khichdi','Khichdi is a popular traditional dish made using rice and lentils. A one-pot meal that is famously eaten during the monsoon seasons, the term "khichdi" literally means "a mess." This is because of the way the ingredients are mixed and cooked together.','Veg','Lunchtime meal');

insert into recipe_prep_details value(
5,30,1,
'Double Bean- 2.5 tablespoons
Quinoa- 2 teaspoons
Refined Oil- 1.5 teaspoons
Sesame White (til)- 0.25 teaspoons
Salt- 0.5 teaspoons
Cumin- 1 pinch
Asafoetida/hing- 1 pinch
Coriander Powder- 1 pinch
Garam Masala- 1 pinch
Turmeric Powder- 1 pinch
Red Gram Lentil (masoor Dal)- 1.5 tablespoons
Rolled Oats- 1.5 tablespoons
Red Dry Chilli Bydagi- 1 unit
Cauliflower- 1 piece
Haricot Bean- 4 units
Onion- 1 large piece
Water- 2.5 glasses
Green Chillies- 1.5 units
Jeera Powder- 0.5 teaspoons',
'
1. In a bowl, add Water, Lima Beans and soak for 10 hrs or overnight.
2. In a heavy bottom vessel, add Water, soaked Lima Beans and cook for 25 to 30 mins. It should be soft not mashed.
3. Boil Water in a heavy bottom vessel. Add Cauliflower and bring to boil.
4. Boil Water in a heavy bottom vessel. Add Beans bring to boil then drain it and keep aside.
5. In a heavy bottom vessel, add Water bring to boil. Add Quinoa and cook for 15-20 mins over a medium flame. Drain the water and set aside.
6. Heat Oil in a pan. Add Sesame Seeds, toss till slightly golden brown.
7. Add half of the boiled Cauliflower, Beans and season with Salt.
8. Continue tossing for 30 seconds on low flame. Remove it to a bowl and set aside.
9. Heat Oil in a pan. Add slit Chilli and toss till it lightly blister. It should still appear freshly green chilli.
10. Remove it to a bowl and keep aside.
11. Heat Oil in a pan. Add Cumin Seeds, Onion, Green Chilli and saute.
12. Add Hing, Cumin Powder, Coriander Powder, Garam Masala, Turmeric Powder and cook.
13. Add Water and cook the Masala.
14. Add Masoor Dal with Water and cook till half done.
15. Add Quinoa, Lima Beans, Oats and cook.
16. Add remaining boiled Cauliflower, Beans, Salt and cook. Remove it to a bowl.
17. In another pan, heat Oil and add Dry Chilli and saute.
18. Add the tadka to the above khichdi and cover it for 5 mins. And then mix it well.
19. Garnish with Sesame Garnish, Sautéed Green Chilli.');
insert into nutri_content values(
390,61,19,8,7,44,5);

/* 6 */
insert into recipes value(
6,'Sugar free mango icecream','Summers in India is all about juicy and delicious mangoes. Who does not like to spend summers flooded with a variety of mangoes and mango flavoured ice-creams, shakes and whatnot? Mango ice cream is the most popular and easy to make dessert recipe.','Veg','Dessert' );

/*update recipes
SET Recipe_description = 'Summers in India is all about juicy and delicious mangoes. Who does not like to spend summers flooded with a variety of mangoes and mango flavoured ice-creams, shakes and whatnot? Mango ice cream is the most popular and easy to make dessert recipe.'
WHERE Recipe_id=6;*/

insert into recipe_prep_details value(
5,'00:15',2,
'
Honey-0.25 cups
Saffron- 1 pinch
Mango- 6 units
Fresh Cream- 150 ml
Pista- 2 tablespoons', 
'1. Clean and peel the mango. Cut the flesh and discard the seed. Add the mango flesh to the blender jar and make a mango puree.
2. Transfer the mango puree to a bowl. Add fresh cream and whisk to combine everything.
3. Add saffron and half of the pistachio to the mixture. Mix well. Add a little honey to taste.
4. Mix everything well and transfer to a freezer-proof container. Keep the container in a freezer for 5-6 hours or overnight until the ice-cream is set.
5. Once the ice-cream is set, scoop and serve with some fresh mango cubes, drizzled honey, and pistachio.');

insert into nutri_content values(
512,61,7,26,13,49,6);

/* 7 */
insert into recipes value(
7,'Veg Biryani','If you are looking for a healthy, one-pot, vegetarian recipe, full of Indian flavours, look no further, because we have a recipe just for you. This recipe is not only quick and easy to make but is extremely delicious and very popular all across India.', 'Veg','Dinner Meal');

insert into recipe_prep_details value(
7,'01:05',4,'
Red Chilli Powder- 0.5 teaspoons
Turmeric Powder- 0.25 teaspoons
Salt- 1 teaspoon
Biryani Masala- 2 teaspoons
White Basmati Rice- 1 cup
Refined Oil- 2 tablespoons
Slim Milk- 0.5 cups
Ginger Garlic Paste- 1 tablespoon
Coriander W/o Roots- 10 g
Carrot-regular- 1 piece
Peeled Green Peas- 0.5 cups
Onion- 2 large pieces
Curd- 0.5 cups
Cauliflower- 100 g
Ghee- 1 tablespoon
Water- 2 cups
Green Chillies- 4 small pieces',
'1. Clean the vegetables and cut carrot into the dices and cauliflower into florets. Slice the onion, chop the coriander leaves and slit the green chilli into two.
2. Wash the rice and soak it for 45 minutes.
3. Take a mixing bowl. Add curd with all powder spices & ginger garlic paste. Mix well and set aside.
4. Take a pressure cooker and add oil into it. Add sliced onions and cook till golden in colour.
5. Once cooked take half of the onion portion out and set aside to use as garnish and add the other half to the marinade.
6. Once the marination is cooked, add diced vegetables & green peas and saute for sometime.
7. Add the soaked rice. Add 2 cups of water with 1/2 cup of milk. Water level should be 1 inch over rice. Add slit green chilli, chop coriander leaves and add desi ghee.
8. Close the pressure cooker and cook it on steam for 10 minutes on low flame. Turn off the flame and let it rest for 20 minutes. Open the pressure cooker, mix well and check the seasoning. Garnish it with caramelized onion and serve hot.');
 
insert into nutri_content values(
264,46,8,5,4,60,7);

/* 8 */
insert into recipes value(
8,'Cold Coffee', 'There’s just something about cold coffee that brings a smile to your lips, isn’t it? While a steaming hot cup of java in the morning is the best bet for your caffeine kick, nothing beats the heat on a hot summer day like cold coffee does!','Veg','Drinks');
insert into recipe_prep_details value(
8,'00:10', 1,'
Slim Milk- 1 cup
Coffee Powder- 0.75 teaspoons
Honey- 1 tablespoon','1. In a blender, add Slim Milk, Instant Coffee Powder and Honey. Blend it till it gets frothy.
2. Serve chilled in a glass. Garnish with Coffee Powder.');
insert into nutri_content values(
128,25,7,0,0,0,8);

/* 9 */
insert into recipes value(
 9,'ChickenSchezwan Momos','Momos were first introduced in Nepal during the 14th century. Momos were brought to Japanese cuisine and spread to other countries. Soon enough as the years went by, restaurants and five-star eateries added it to their menus.','Non-Veg','Japanese Starter');
insert into recipe_prep_details value(
9,'00:20',2,
'
Atta- 0.5 cups
Refined Oil- 2 teaspoons
Salt- 1 teaspoon
Jaggery- 0.5 teaspoons
Red Dry Chilli Bydagi- 6 pieces
Synthetic/white Vinegar- 2 teaspoons
Chicken Mince- 200 g
Ginger- 6 g
Onion- 2 units
Spring Onion- 6 g
Carrot-regular- 1 unit
Celery- 0.5 unit
Garlic- 5 pieces
Green Chillies- 3 pieces
Water- 1 cup
Green Cabbage- 0.33 cups', '1. Dough for momos : In a mixing bowl add whole wheat flour, salt, oil. mix. Then gradually add water to knead till a tight dough is formed. Allow the dough to rest for 15min.
2. Divide the dough into equal pieces. one by one on a floured surface roll them out till paper thin. Cut into a 2 1/2 inch round with a cutter. Cover and keep with a cloth. Repeat till all the dough is used up.
3. Heat oil in a pan, add ginger, garlic, onion and saute. Then add celery and cook it well. Add water and dry red chilli. Cook until the chilli gets soft.
4. Add vinegar, schezwan pepper and salt to taste. Let the mixture cool down and grind to make fine paste.
5. For momos stuffing : In a mixing bowl add the chicken mince, cabbage, green chili, carrot, spring onions, remaining chopped ginger, onion and garlic. Add 1 tbsp schezwan sauce along with salt, 1tsp vinegar and pepper. Mix well.
6. Assembly : Place the cut up rounds one by one on a floured surface. Place an appropriate amount of mixture in the centre and dampen the border. Seal the edges and fold into the desired shape.
7. Meanwhile, keep a pot filled with water and let it boil. Prepare a steamer. As the water starts to boil, place the momos in the steamer and cover with a lid.
8. Allow the momos to steam till cooked through for 8 to 10 min or till cooked through. Gently remove the momos on a plate and serve with schezwan sauce.');
insert into nutri_content values(
471,76,20,4,5,64,9);

/* 10 */
insert into recipes value(
10, 'Healthy Chicken Manchow Soup','Healthy Chicken Manchow Soup is an Indo-Chinese soup served famously in Indian streets. It falls under the category of thick soup which uses corn flour as a thickening agent. An all-time favorite it is an excellent starter for any meal.','Non-Veg','Soup');
insert into recipe_prep_details value(
9,'00:10',2,'
Light Soy Sauce- 2 tablespoons
Refined Oil- 2 teaspoons
Salt- 1 teaspoon
Whole Wheat Noodles- 60 g
Corn Flour- 1 teaspoon
Ginger- 4 g
Onion- 1 unit
Carrot-regular- 1 unit
French Beans- 9 pieces
Spring Onion- 8 g
Chicken Stock- 22 cups
Pepper- 1 teaspoon
Red Chilli Paste- 2 teaspoons
Garlic- 4 pieces
Green Cabbage- 50 g
Water- 2 cups', 
'1. Boil the noodles with little salt and oil. Once it is soft, drain it. Drizzle a little oil over the noodles to prevent sticking. Bake the noodles to make it crispy at 180 degrees for 10 minutes.
2. Fine chop the ginger, garlic, onion, cabbage, carrot, beans and keep it aside. Cut the chicken into dice and set aside.
3. Heat oil in a pan, add chopped ginger, and garlic saute well. Add chopped cabbage, carrot until it is soft and chilli paste and cook well.
4. Add chicken strips to the sauteed vegetables .
5. Add chicken stock and add soy sauce, adjust the seasoning. Mix corn flour with little water.
6. Add corn slurry and let it boil for a min. Finish it with lemon juice and check seasoning.
7. Serve hot with the crispy noodles. Garnish with spring onion.');

insert into nutri_content values(
484,39,39,17,10,80,10);

/* 11 */
insert into recipes value(
11,'Vegan Rice Kheer','Rice Kheer is a sweet dish that you would find in Indian households during the festive season. Now, if you are a vegan or are lactose intolerant, you too can enjoy this delectable dessert right away!','Vegan','Dessert');
insert into recipe_prep_details value(
11,'00:30',3,'White Rice- 0.5 cups
Jaggery- 0.5 cups
Cardamom Powder- 1 teaspoon
Cashewnut (2 Piece Split)- 8 pieces
Almond- 6 pieces
Raisins- 10 pieces
Refined Oil- 1 teaspoon
Coconut Milk- 1 cup
Water- 6 cups','1. Wash and soak rice in water for 15 minutes. Drain the water and keep it aside
2. Bring the rice to boil with 5 cups of water and cook the rice till it gets soft
3. Dry roast the cashew and almond. Chop into chunks and set aside
4. In a pan add the mashed rice. Then add coconut milk along with cardamom powder and mix well till combined. Do so on a medium flame
5. Add jaggery powder and stir to melt. Add the raisins and simmer for a few minutes. Before mixing, fold in the toasted nuts (save some for garnish)
6. Once the kheer thickens, check sweetness and take it off the flame
7. Sprinkle with a few toasted nuts and serve.');
insert into nutri_content value(
1540,201,56,85,79,301,11);
insert into recipes value(
12,'Muffins','Muffins are single-serving quick breads, which rise with the help of baking soda or baking powder and eggs instead of yeast. They tend to be sweet and somewhat moist, but heavier than a cake or cupcake. Muffins are baked in a pan with cup-sized indentations.', 'Bakery','Bakery');
insert into recipe_prep_details value(
12, '00:35',12,'2 cups all-purpose flour
3 teaspoons baking powder
½ teaspoon salt
¾ cup white sugar
1 egg
1 cup milk
¼ cup vegetable oil','1.Preheat the oven to 400 degrees F (200 degrees C). Grease a 12-cup muffin tin or line cups with paper liners.
2.Stir flour, baking powder, salt, and sugar together in a large bowl; make a well in the center.
3.Beat egg with a fork in a small bowl or 2-cup measuring cup; whisk in milk and oil. Pour egg mixture all at once into flour mixture; mix quickly and lightly with a fork until just moistened. The batter will be lumpy. (Fold in additional ingredients if using; see variations below). Spoon batter into the prepared muffin cups, filling each 3/4 full.
4.Bake in the preheated oven until tops spring back when lightly pressed, about 25 minutes.'
);
insert into nutri_content value(
1540,201,56,85,79,301,11);

create table if not exists contacts(
Name varchar(122), Email varchar(122), Message varchar(2000), date datetime, constraint pk_contacts primary key(name)
);
select * from users