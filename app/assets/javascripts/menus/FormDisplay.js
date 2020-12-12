document.addEventListener('DOMContentLoaded', () => {

  var tab = document.querySelector('.js-tab-trigger');

  tab.addEventListener('click', () => {
    document.querySelector('.js-tab-target').classList.add("is-active")
  });

});
