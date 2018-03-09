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
      $("#comment_content").val(" ");
      let newComment = new Comment(response)
      let commentData = newComment.renderComments()
      $("div.comments").text(comment["content"]);
      // debugger
      var $ol = $("div.comments ol")
      $ol.append(commentData);
    });
  });
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
  this.id = data.id
  this.content = data.content
}

Comment.prototype.renderComments = function(){
  return `<li>${this.content} <a data-method="delete" href="/comments/${this.id}"> Delete</a></li>`
}
