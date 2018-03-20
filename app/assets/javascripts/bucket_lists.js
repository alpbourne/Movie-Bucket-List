$(function(){
  $("a.load_comments").on("click", function(e){
    $.ajax({
      method: "GET",
      url: `${this.href}.json`,
    }).done(function(data){
      data.forEach(function(e){
        let newComment = new Comment(e)
        let commentData = newComment.renderComments()
        var $ol = $("div.comments ol")
        $ol.append(commentData);
      })
      // serializeData= $(data).serialize();
      // console.log(data)
      // $("div.comments").html(serializeData)
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
      var $ol = $("div.comments ol")
      $ol.append(commentData);
    });
  });
  $("a.load_details").on("click", function(e) {
    $.ajax({
      method: "GET",
      url: this.href,
    }).done(function(data){
      $(`div.details-${e.target.id}`).html(data)
    });
    e.preventDefault();
  });
});


function Comment(data) {
  this.id = data.id
  this.content = data.content
}

Comment.prototype.renderComments = function(){
  return `<li>${this.content} <a data-method="delete" href="/comments/${this.id}"> Delete</a></li>`
}
