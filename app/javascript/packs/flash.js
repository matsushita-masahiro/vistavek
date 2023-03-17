const closeFlash = document.getElementById('close-flash');
const flash = document.querySelector('.flash');

if(closeFlash != null) {
  closeFlash.addEventListener('click', () => {
      flash.style.display = "none";
  });
};