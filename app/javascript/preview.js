document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item-image')){
  const ImagePreview = document.getElementById('image-preview');
  document.getElementById('item-image').addEventListener('change', function(e){
    const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    // 画像を表示するためのdiv要素を生成
    const imageElement = document.createElement('div');

    // 表示する画像を生成
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);

    // 生成したHTMLの要素をブラウザに表示させる
    imageElement.appendChild(blobImage);
    ImagePreview.appendChild(imageElement);
  });
  }
});