// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require rails-ujs
//= require_tree .


document.addEventListener("turbolinks:load", function() {
  // hoverでparent_categoryを開くーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  const category_btn = document.querySelector('#category_button')
  const categoryList_container = document.querySelector('.category-list__container')    
  
  category_btn.addEventListener('mouseenter', () => {
    categoryList_container.classList.add('open_category-list')
  });        
  category_btn.addEventListener('mouseleave', () => {
    categoryList_container.classList.remove('open_category-list')
  });        
  
  categoryList_container.addEventListener('mouseenter', () => {
    categoryList_container.classList.add('open_category-list')
  });        
  categoryList_container.addEventListener('mouseleave', () => {
    categoryList_container.classList.remove('open_category-list')
  });        
  $('.category-list__container').hover(function(){},function(){
    $(this).removeClass('open_category-list');
  })
  
  // 動的なカテゴリリストの追加・削除ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  
  // parent_catogoryをhoverしたとき
  $('.parent_category__li').hover(function(){
    // hoverしてないときに使う要素
    $('#category_button')
    $('.category-list__container')    

    $(this).find('a').css('backgroundColor','rgb(233, 232, 232)');
    var parent_category_number = $(this).data('parent') //hoverした<li>のdata-parent属性を取得
    $(this).css('backGroundColor','rgb(233, 232, 232)');
    var child_lists = '';
    
    // 取得したidをもとに､child-categories[i]を指定して､.each do |child| で<li>を作成する
    gon.child_categories[parent_category_number].forEach(function(child, i){         
      // parentをもとに､取り出したchild配列からhashを取り出し､一つずつに対し､<li>を作成
      var child__li = `<li class="child-category__li" data-child="${i}">
                            <a href="/categories/${child.id}">${child.name}</a>
                        </li>`;
      // <li>を一つにまとめる
      child_lists += child__li;
    });        
    // <ul>に入れるための関数
    var child_category_ul = `<ul class='child-category__ul'>
                              ${child_lists}
                              </ul>`;
    $(this).append(child_category_ul);
    
    // child_categoryをhoverしたときーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
    $('.child-category__li').hover(function(){
      $(this).find('a').css('backgroundColor','rgb(233, 232, 232)')
      var child_category_number = $(this).data('child') //hoverした<li>のdata-parent属性を取得
      var grand_child_lists = '';
      
      // 取得したidをもとに､child-categories[i]を指定して､.each do |child| で<li>を作成する
      gon.parent_array[parent_category_number][child_category_number].forEach(function(grand_child){         
        // parentをもとに､取り出したgrandchild配列からhashを取り出し､一つずつに対し､<li>を作成
        var grand_child__li = `<li class="grand_child-category__li">
                                 <a href="/categories/${grand_child.id}">${grand_child.name}</a>
                               </li>`;
        // <li>を一つにまとめる
        grand_child_lists += grand_child__li;
      });        
      // <ul>に入れるための関数
      var grand_child_category__ul = `<ul class='grand_child-category__ul'>
                                        ${grand_child_lists}
                                      </ul>`;
      $(this).append(grand_child_category__ul);      
    },function(){
      $(this).find('a').css('backgroundColor','#ffffff');
      $('.grand_child-category__ul').remove();
    });
    
  },function(){
    $(this).find('a').css('backgroundColor','#ffffff');
    $('.child-category__ul').remove();
  });
});