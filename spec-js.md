# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
      Used Jquery for my function to load comments, create a comment, and load details of a movie.
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
      Under each movie on the index page you can click a details link that will show the individual movie's show page underneath. There is also a Movie Serializer.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
      When you are in the show page of a bucket list you can click load comments and all the comments for that bucket list will appear below. There are serializers for comments, bucket_lists, and bucket_list_comment.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
      BucketLists has_many Comments.
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
      On the BucketList show page you can load comments, create a comment and see the new comment appear in the comment list above.
- [x] Translate JSON responses into js model objects.
      When creating a new Comment, it creates a JS Comment model object.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
      The JS Comment model object has a renderComments method added to the prototype.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
