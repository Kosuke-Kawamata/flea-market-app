$(document).on("click", ".user-icon__wrapper", function(){
  var icon_preview = $(
    '<div class="user-icon-preview__wrapper">'+
      '<img class="user-icon-preview__img">'+
    '</div>'
  );
  $label = $(this).parents('.user-icon__label');

  $(".user-icon__input").on('change', function(e){
    var reader = new FileReader();
    reader.readAsDataURL(e.target.files[0]);
    reader.onload = function(e){
      $(icon_preview).find(".user-icon-preview__img").attr("src", e.target.result);
    };

    icon_preview.prependTo($label);
    $('.user-icon__wrapper').css('display', 'none');
  });
});

$(document).on("click", ".user-icon-preview__wrapper", function(){
  var icon_preview = $(
    '<div class="user-icon-preview__wapper">'+
      '<img class="user-icon-preview__img">'+
    '</div>'
  );
  $label = $(this).parents('.user-icon__label');

  
  $(".user-icon__input").on('change', function(e){
    var reader = new FileReader();
    reader.readAsDataURL(e.target.files[0]);
    reader.onload = function(e){
      $(icon_preview).find(".user-icon-preview__img").attr("src", e.target.result);
    };

    $('.user-icon-preview__wrapper').remove();
    
    icon_preview.prependTo($label);
  });
});

