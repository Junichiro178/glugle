$(document).on('turbolinks:load', function(){
  
  var slider = ".slider";
  var thumbnailItem = ".thumbnail-list .thumbnail-item";
  
  $(thumbnailItem).each(function(){
    var index = $(thumbnailItem).index(this);
    $(this).attr("data-index",index);
  });

  $(slider).on('init',function(slick){
    var index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
    $(thumbnailItem+'[data-index="'+index+'"]').addClass("thumbnail-current");
  });

  $(slider).slick({
    arrows: false,
    infinite: false
  });

  $(thumbnailItem).on('mouseover click',function(){
    var index = $(this).attr("data-index");
    $(slider).slick("slickGoTo",index,false);
  });
  
  $(slider).on('beforeChange',function(event,slick, currentSlide,nextSlide){
    $(thumbnailItem).each(function(){
      $(this).removeClass("thumbnail-current");
    });
    $(thumbnailItem+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
  });

  // Menu form display function 
  var btn = document.querySelector('.js-btn-trigger');
  var btnTarget = document.querySelector('.js-btn-target')

  btn.addEventListener('click', () => {
    btnTarget.classList.add("is-active")
  });

  // タブの切り替え機能
  const tabTriggers = document.querySelectorAll('.js-tab-trigger');
  const tabTargets = document.querySelectorAll('.js-tab-target');

    for (let i = 0; i < tabTriggers.length; i++) {
        tabTriggers[i].addEventListener('click', (e) => {

            let currentMenu = e.currentTarget;
            let currentContent = document.getElementById(currentMenu.dataset.id);

            for (let i = 0; i < tabTriggers.length; i++) {
                tabTriggers[i].classList.remove('is-active');
            }

            currentMenu.classList.add('is-active');

            for (let i = 0; i < tabTargets.length; i++) {
                tabTargets[i].classList.remove('is-active');
            }

            if(currentContent !== null) {
                currentContent.classList.add('is-active');
            }
        });
    }

});