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
    // url = this.action
    // console.log(url)

    // data = {
    //   'authenticity_token': $("input[name='authenticity_token']").val(),
    //   'comment': {
    //     'content': $("#comment_content").val()
    //   }
    // };
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize();,
      success: function(data){
        $("#comment_content").val("");
        var $ol = $("div.comments ol")
        $ol.append(response);
      }
    });

    console.log(data);
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
