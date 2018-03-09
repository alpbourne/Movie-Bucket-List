<!-- <% @movies.each do |movie| %>
  <p><%=movie.name%> | <%=movie.genre%> | <%=movie.rating%>
  <%= form_tag "/bucket_list_movies/new" do%>
  <%= hidden_field_tag :movie_id, @movie.id %>
  <%= hidden_field_tag :bucket_list_id, @bucket_list.id %>
  <%= submit_tag "Add to Bucket List"%>
  <% end %> </p>
<% end %> -->

<!-- <%= fields_for(:movies) do |movies| %>
  <%= movies.checkbox :name %>
<% end %> -->

<!-- <%= fields_for(:movies) do |movies| %>
  <%= movies.checkbox :name %>
<% end %> -->
<!-- <%= f.collection_select :movie_ids, Movie.all, :id, :name, include_blank: "" %><br> -->

<!-- <% @movies.each do |m| %>
  <%= f.label m.name %>
  <%= check_box_tag "movie_ids", m.id %>
<% end %> -->

<!-- <%= check_box_tag "[movie_ids][]", m.id %>

  <h3><%= link_to f.name, user_bucket_list_path(f) %></h3>

     redirect_to user_bucket_list_path(current_user, @bucket_list) - show page for indiv bucketlist

     <%= f.label m.bucket_list_movies.seen %>
     <%= check_box_tag "bucket_list[bucket_list_movies_attributes][seen]", m.id %>

     @bucket_list = BucketList.find(params[:bucket_list_id])

     <%= link_to "Edit", user_bucket_list_path(current_user, :id => @bucket_list.id) %>

            <%= check_box_tag "bucket_list[movie_ids][]", m.id %>

            <h4> Select Movies to Add:</h4>
            <% @movies.each do |m| %>
               <% if m.name %>
                 <%= f.label m.name %>
                 <%= check_box_tag "bucket_list[movie_ids][]", m.id %>
               <% end %>
            <% end %>
        @bucket_list = BucketList.find(params[:bucket_list_id])

        def create
          @bucket_list = BucketList.find_by(:id => params[:id])
          if current_user
            @bucket_list_movie= BucketListMovie.new(bucket_list_id: params[:bucket_list_id], movie_id: params[:movie_id], seen: params[:seen])
            @bucket_list_movie.save
            binding.pry
            @bucket_list.movies << @bucket_list_movie
            redirect_to user_bucket_lists_path(current_user)
          else
            flash[:alert] = "Please make sure all fields are filled out correctly"
            redirect_to new_bucket_list_movie_path(movie_id: movie.id)
          end
        end

        def create
          @bucket_list = BucketList.find(params[:bucket_list_id])
          if current_user
            @bucket_list_movie= BucketListMovie.new(bucket_list_id: params[:bucket_list_id], movie_id: params[:movie_id], seen: params[:seen])
            @bucket_list_movie.save
            @bucketlist.movies << @bucket_list_movie
            redirect_to user_bucket_lists_path(current_user)
          else
            flash[:alert] = "Please make sure all fields are filled out correctly"
            redirect_to new_bucket_list_movie_path(movie_id: movie.id)
          end
        end
 @bucket_list.movies.build(@bucket_list_movie)

 def create
   @bucket_list_movie= BucketListMovie.create(bucket_list_id: params[:bucket_list_id], movie_id: params[:movie_id], seen: params[:seen])
   @bucket_list = BucketList.find_by(:id => params[:id])
   @bucket_list = BucketList.find_by(:id => params[:id])
   if @bucket_list_movie.save
     if params[:id]
       @bucket_list.movies << @bucket_list_movie
       redirect_to user_bucket_lists_path(current_user.id)
     end
   else
     flash[:alert] = "Please make sure all fields are filled out correctly"
     redirect_to new_bucket_list_movie_path(movie_id: params[:movie_id])
   end
 end

 def destroy
   @bucketlistmovie = BucketListMovie.find(bucket_list_id: params[:bucket_list_id], movie_id: params[:movie_id])
   @bucketlistmovie.destroy
   redirect_to user_bucket_lists_path(current_user)
 end

 <% @bucket_list.movies.each do |f| %>
   <%= f.name %>
   <%= link_to "Delete", bucket_list_movie_path(current_user, f.id), :method => :delete %>


      def delete_movie
        @bucket_list = BucketList.find(params[:id])
        @bucket_list.movies.delete(Movie.find(params[:id]))
        if @movie.save
          redirect_to edit_user_bucket_list_path(current_user,:id => @bucket_list.id)
        else
          flash[:alert] = "Can't delete movie from Bucket List"
          redirect_to edit_user_bucket_list_path(current_user, :id => @bucket_list.id)
        end
      end

      def new
        @bucket_list_movie= BucketListMovie.new(bucket_list_id: params[:bucket_list_id], movie_id: params[:movie_id], seen: params[:seen])
      end

      def create
        @bucket_list = BucketList.find_by(:id => params[:id])
        if current_user
          @bucket_list_movie= BucketListMovie.create(bucket_list_id: params[:bucket_list_id], movie_id: params[:movie_id], seen: params[:seen])
          @bucket_list_movie.save
          @bucket_list.movies.all << @bucket_list_movie
          redirect_to user_bucket_lists_path(current_user)
        else
          flash[:alert] = "Please make sure all fields are filled out correctly"
          redirect_to new_bucket_list_movie_path(movie_id: movie.id)
        end
      end
      <!-- <h4> Have you seen this movie? </h4>
      <%= f.check_box :seen? %><br> -->


      <!-- <% if current_user %>
       <%= link_to("Sign Out", destroy_user_session_path, :method => 'delete') %>
       <%= link_to "Your Bucket Lists", user_bucket_lists_path(current_user.id) %>
       <%= link_to "Create New Bucket List", new_user_bucket_list_path(current_user.id) %>
       <%= link_to "All Movies", movies_path %>
       <%= link_to "Highest Rated Movies", highest_rating_path %>
       <%= link_to "Create New Movie", new_movie_path %>
       <p>
         Signed in as <%= "#{current_user.email}" %>
       </p>
      <% else %>
        <%= link_to "Sign up", new_user_registration_path  %>
        <%= link_to "sign in",  new_user_session_path  %>
        <%= link_to "Sign in with Facebook", user_facebook_omniauth_authorize_path %>
      <% end %> -->
      <!-- //   url = this.action
      //   console.log(url)
      //   data = {
      //     'authenticity_token': $("input[name='authenticity_token']").val(),
      //     'comment': {
      //       'content': $("#comment_content").val()
      //     }
      //   };
      //   $.ajax({
      //     type: "POST",
      //     url: url,
      //     data: data,
      //     success: function(response){
      //       let newComment = new Comment(response)
      //       let commentData = newComment.renderComments()
      //       $("comment_content").val(" ");
      //       var $ol = $("div.comments ol")
      //       $ol.append(commentData);
      //     }
      //   })
        // console.log(data);
        // e.preventDefault();
      // }); -->
