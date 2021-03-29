
  document.addEventListener("turbolinks:load", function() {

    console.log('ページが読み込まれた')

    // カテゴリボタンの取得・カテゴリコンテナーの取得
    // window.onload = function() {
    // }
      const category_btn = document.querySelector('#category_button')
      const categoryList_container = document.querySelector('.category-list__container')
      console.log(category_btn)
      console.log(categoryList_container)
    
    // もし､上の2つがなければ､return｡ あれば､クリックしたときにクラスの付け外しをする
    if(category_btn == null){
      console.log('ボタンない')
      return
      
    }else{           
      category_btn.addEventListener('click', () => {
        console.log('クリックした')
        categoryList_container.classList.toggle('open_category-list')
      });
      
    }
    
  })