document.addEventListener('turbo:load', () => {
  const burger = document.querySelector('.burger-menu');
  const menu = document.querySelector('.dropdown-menu');

  burger.addEventListener('click', () => {
    menu.classList.toggle('hidden');
  });
});