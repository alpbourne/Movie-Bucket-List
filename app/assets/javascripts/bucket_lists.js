$(function(){
  $("a.load_comments").on("click", function(e){
    // .ajax({
    //   method: "GET",
    //   url: this.href,
    // }).done(function(data){
    //   $("div.comments").html(data)
    // });
    $.get(this.href).success(function(data){
      $("div.comments").html(data)
    })
    e.preventDefault();
  })
})






// function Movie(name, genre, rating) {
//   this.name = name
//   this.genre = genre
//   this.rating = rating
// }
//
// Movie.prototype.renderMovies = function(){
//   return ''
// }
