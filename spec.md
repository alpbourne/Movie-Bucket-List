# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
      Users has_many bucket_lists, BucketList has_many bucket_list_movies, Movies has_many bucket_list_movies
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
      BucketList belongs to User, BucketListMovie belongs to BucketList and Movie
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
      BucketList has_many Movies through bucket_list_movies, Movie has_many BucketLists through bucket_list_movies,
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
      bucket_list_movie.seen - users can mark BucketListMovies as seen
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    Movie: validates name presence and uniqueness as true, genre and rating presence as true
    BucketList: validates name presence and uniqueness as true
    User: validates email uniqueness as true
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    /movies/highest_rating - view the movies with ratings over 8.5
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
    bucket_list_movies_attributes - custom attribute writer is in BucketList model and is used in the edit BucketList form at /users/2/bucket_lists/7/edit
- [x] Include signup (how e.g. Devise)
    Devise
- [x] Include login (how e.g. Devise)
    Devise
- [x] Include logout (how e.g. Devise)
    Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    Devise/OmniAuth for Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    /users/2/bucket_lists
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
    /users/:user_id/bucket_lists/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    /movies/new - "Please Log In First"+"Please make sure all fields are filled out correctly"
    /movies/:id/edit - "Please make sure all fields are filled out correctly"
    /bucket_list_movies/new - "Please make sure all fields are filled out correctly"
    /users/:user_id/bucket_lists/new - "Please make sure all fields are filled out correctly"
Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
