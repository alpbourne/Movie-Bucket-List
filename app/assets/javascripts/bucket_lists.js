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
    e.preventDefault();
    var values = $(this).serialize();
    var comment = $.post(this.action, values);

    comment.done(function(response){
      $("comment_content").val(" ");
      let newComment = new Comment(response)
      let commentData = newComment.renderComments()
      $("div.comments").text(comment["content"]);
      debugger
      var $ol = $("div.comments ol")
      $ol.append(commentData);
    });
  });
  //   url = this.action
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
  // });
  // $("a.load_details").on("click", function(e) {
  //   $.ajax({
  //     method: "GET",
  //     url: this.href,
  //   }).done(function(data){
  //     $("p.card_text").html(data)
  //   });
  //   e.preventDefault();
  // });
});


function Comment(data) {
  this.content = data.content
}

Comment.prototype.renderComments = function(){
  return `<li>${this.content} <a data-method="delete" href="this.url"> Delete</a></li>`
}
