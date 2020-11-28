document.addEventListener("turbolinks:load", function(){
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file" name="cafe_restaurant[images_attributes][${index}][image]" id="cafe_restaurant_images_attributes_${index}_image">
                    <div class="js-remove">
                      <span>削除</span>
                    </div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    let count = $('.js-file').length;
    if (count < 10) {
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

  // let imageBox = document.getElementById('image-box');
  // let upLoader = document.querySelector('.js-file');
  //   // removeBtn = imageBox.querySelector('.js-remove');
  

})