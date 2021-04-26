
  document.addEventListener("turbolinks:load", function() {
    // カテゴリボタンの取得・カテゴリコンテナーの取得
    // window.onload = function() {
    // }
      const category_btn = document.querySelector('#category_button')
      const categoryList_container = document.querySelector('.category-list__container')    
    // もし､上の2つがなければ､return｡ あれば､クリックしたときにクラスの付け外しをする
    if(category_btn == null){
      return
      
    }else{           
      category_btn.addEventListener('click', () => {
        categoryList_container.classList.toggle('open_category-list')
      });
      
    }
    
  })