document.addEventListener('DOMContentLoaded',function(){
  // 新規投稿・編集ページのフォームを取得
  const postForm = document.getElementById('new_post');
  // プレビューを表示するためのスペースを確保
  const previewList = document.getElementById('previews')
  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!postForm) return null;
  console.log("preview.jsが読み込まれました");

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="item[image]"]');
  // input要素に変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
    // 古いプレビューが存在する場合は消去
    const alreadyPreview =document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    console.log("input要素で値が変化しました");
    // input要素の中の画像を取得
    console.log(e.target.files[0]);
    const file = e.target.files[0]
    // 画像データにアクセスできるURL作成
    const blob = window.URL.createObjectURL(file);
    console.log(blob);
    // 画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src',blob);
    previewImage.setAttribute('width',112);
    previewImage.setAttribute('height',112);

    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
});