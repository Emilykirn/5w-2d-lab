CREATE TABLE users (
user_id	integer	 
username	varchar(50)	 
password	varchar(50)	 
firstname	varchar(50)	 
lastname	varchar(50)	 
email	varchar(50)	 
 Add field
	ingredient_id	integer	 
name	varchar(40)	 
 Add field
	recipe_id	integer	 
name	varchar(255)	 
creator	varchar(40)	 
privacy	boolean	 
 Add field
	ingredient_user_id	integer	 
ingredient_id	integer	 
user_id	integer	 
 Add field
	ocassions_id	binary	 
name	varchar(50)	 
 Add field
occasion_recipe_id	integer	 
occasion_id	integer	 
recipe_id	integer	 
 Add field
	recipe_ingredient_id	integer	 
ingredient_id	integer	 
recipe_id	integer	 
 Add field
 
Schema Name:	DB Lab
Database:	
 
DB Lab
Users
user_id
username
password
firstname
lastname
email
Ingredient Names
ingredient_id
name
Recipe Names
recipe_id
name
creator
privacy
Grocery List
ingredient_user_id
ingredient_id
user_id
Occassion Tag
ocassions_id
name
Occassion Recipe
occasion_recipe_id
occasion_id
recipe_id
Ingredients Recipe
recipe_ingredient_id
ingredient_id
recipe_id
 
11/15/2022, 15:18:35
 
Enter your comment here
Send
 Refresh Comment List
 CREATE TABLE "public.Users" (
	"user_id" serial NOT NULL,
	"username" varchar(50) NOT NULL,
	"password" varchar(50) NOT NULL,
	"firstname" varchar(50) NOT NULL,
	"lastname" varchar(50) NOT NULL,
	"email" varchar(50) NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Ingredient Names" (
	"ingredient_id" serial NOT NULL,
	"name" varchar(40) NOT NULL,
	CONSTRAINT "Ingredient Names_pk" PRIMARY KEY ("ingredient_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Recipe Names" (
	"recipe_id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"creator" varchar(40) NOT NULL,
	"privacy" BOOLEAN NOT NULL DEFAULT 'No',
	CONSTRAINT "Recipe Names_pk" PRIMARY KEY ("recipe_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Grocery List" (
	"ingredient_user_id" serial NOT NULL,
	"ingredient_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT "Grocery List_pk" PRIMARY KEY ("ingredient_user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Occassion Tag" (
	"ocassions_id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	CONSTRAINT "Occassion Tag_pk" PRIMARY KEY ("ocassions_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Occassion Recipe" (
	"occasion_recipe_id" serial NOT NULL,
	"occasion_id" integer NOT NULL,
	"recipe_id" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Ingredients Recipe" (
	"recipe_ingredient_id" serial NOT NULL,
	"ingredient_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "Ingredients Recipe_pk" PRIMARY KEY ("recipe_ingredient_id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "Recipe Names" ADD CONSTRAINT "Recipe Names_fk0" FOREIGN KEY ("creator") REFERENCES "Users"("user_id");

ALTER TABLE "Grocery List" ADD CONSTRAINT "Grocery List_fk0" FOREIGN KEY ("ingredient_id") REFERENCES "Ingredient Names"("ingredient_id");
ALTER TABLE "Grocery List" ADD CONSTRAINT "Grocery List_fk1" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");


ALTER TABLE "Occassion Recipe" ADD CONSTRAINT "Occassion Recipe_fk0" FOREIGN KEY ("occasion_id") REFERENCES "Occassion Tag"("ocassions_id");
ALTER TABLE "Occassion Recipe" ADD CONSTRAINT "Occassion Recipe_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipe Names"("recipe_id");

ALTER TABLE "Ingredients Recipe" ADD CONSTRAINT "Ingredients Recipe_fk0" FOREIGN KEY ("ingredient_id") REFERENCES "Ingredient Names"("ingredient_id");
ALTER TABLE "Ingredients Recipe" ADD CONSTRAINT "Ingredients Recipe_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipe Names"("recipe_id");



