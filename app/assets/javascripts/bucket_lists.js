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
    url = this.action
    console.log(url)
    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'comment': {
        'content': $("#comment_content").val()
      }
    };
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response){
        $("comment_content").val(" ");
        var $ol = $("div.comments ol")
        $ol.append(response);
      }
    })

    console.log(data);
    e.preventDefault();
  });
  $("a.load_movie_details").on("click", function(e) {

  })
});


function Comment(data) {
  this.content = data.content
}

Comment.prototype.renderComments = function(){
  return `<li>${this.content} <a data-method="delete" href="this.url"> Delete</a></li>`
}
