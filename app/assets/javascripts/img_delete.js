//削除ボタンをクリックしたとき、処理が動く。
$(document).on('click','.image-preview_btn_delete',function(){
  var append_input = $(
    '<li class="input">'+
      '<label class="upload-label">'+
        '<div class="upload-label__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード'+
          '<div class="input-area">'+
            '<input class="hidden image_upload" type="file">'+
          '</div>'+
        '</div>'+
      '</label>'+
    '</li>'
  );
  $ul = $('#previews')
  $ul = $('#previews') //←これ2つ目いるか？
  $lis = $ul.find('.image-preview');
  // $lis は<ul>タグの中にある<li>全部
  $li = $(this).parents('.image-preview');
  // $li はクリックした.image-preview_btn_delete の親要素の<li>
  $input = $ul.find('.input');


  //"li.image-preview"ごと削除して、previewとinputを削除
  $li.remove();

  $lis = $ul.find('.image-preview');
  // <li>を一つ削除したあとに､<li>全体を取得し直している
  $label = $ul.find('.input');
  // ↑これって<li.input>のこと？これいるか？つかってなくないか？
  
  
  // <li>の数により､条件文で<input>ボタンのサイズを更新・追加
  // <li.image-preview> が4以下・5・9以下・9のときで場合分け
  if($lis.length <= 4 ){
    $('#previews li:last-child').css({
      'width': `calc(100% - (20% * ${$lis.length}))`
    })
  }
  else if($lis.length == 5 ){
    $('#previews li:last-child').css({
      'width': `100%`
    })
  }
  else if($lis.length < 9 ){
    $('#previews li:last-child').css({
      'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
    })
  }
  else if($lis.length == 9 ){
    $ul.append(append_input) //10個目の<li.preview>を削除したら､その下には<li.input>が生成されてないので､inputを追加
    $('#previews li:last-child').css({
      'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
    })
  }
});