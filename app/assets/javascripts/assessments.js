
// 完全読み込み後に実行する処理
window.onload = function() {
}

// turbolinksをなしにして､loadさせてからjsを読み込ませるとうまくいく
document.addEventListener("turbolinks:load", function() {

  const checkbox = document.querySelector('#checkbox')
  const assessment_wrapper = document.querySelector('#assessment__wrapper')
  
  if(checkbox == null){
    return

  }else{           
    checkbox.addEventListener('change', ()=>{
      if(checkbox.checked){
        assessment_wrapper.style.display = 'block'

      }else{
        assessment_wrapper.style.display = 'none'

      }

    })

  }

})  
