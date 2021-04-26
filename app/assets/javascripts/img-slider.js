$(document).on('turbolinks:load', function(){
  $('.slider').slick({
    dots:true,
    customPaging: function(slick,index) {
      // スライダーのインデックス番号に対応した画像のsrcを取得
      var targetImage = slick.$slides.eq(index).find('img').attr('src');
      // slick-dots > liの中に上記で取得した画像を設定
      return '<img src=" ' + targetImage + ' "/>';
    }
  });
  $( '.slider' ).on( 'mouseenter', '.slick-dots > li', function() {
    $( this ).click();
  });
  $( '.slider' ).on( 'mouseover', '.slick-dots > li', function() {
    $( this ).css({
      cursor: "pointer"
    });
  });
  $( '.slider' ).on( 'mouseout', '.slick-dots > li', function() {
    $( this ).css({
      cursor: ""
    });
  });
});