$(document).ready(function(){

  $('.likes-link').on('click', function(event){
    event.preventDefault();

    var likesCount = $(this).siblings('.likes_count');

    $.post(this.href, function(response){
      likesCount.text(response.new_likes_count);
      });

    $(this).css('visibility', 'hidden');

    // var likesDeleteLink = '<%= link_to "unlike", post_likes_path(post), method: :delete, class: "unlikes-link" %>'

    });

  // $('.unlikes-link').on('click', function(event){
  //   event.preventDefault();

  //   var likesCount = $(this).siblings('.likes_count');

  //   $.post(this.href, function(response){
  //     likesCount.text(response.new_likes_count);
  //   });


  // });

});

