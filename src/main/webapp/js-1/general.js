const menuButton = document.getElementById('menu-button');
const menuContainer = document.getElementById('menu-container');

menuButton.addEventListener('click', () => {
  menuContainer.classList.toggle('show');
});