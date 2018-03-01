$(function(){
  $("a.load_comments").on("click", function(e){
  //   alert("yayy!")
  //   e.preventDefault();
  // })
    $.ajax({
      method: "GET",
      url: this.href,
    }).done(function(data){
      $("div.comments").html(data)
    });
    e.preventDefault();
  });
  $("#new_comment").on("submit", function(e){
    alert("You tried creating a comment")
    e.preventDefault();
  });
});






// function Movie(name, genre, rating) {
//   this.name = name
//   this.genre = genre
//   this.rating = rating
// }
//
// Movie.prototype.renderMovies = function(){
//   return ''
// }
