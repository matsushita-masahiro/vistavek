// console.log("================= home.js");

const arrowLeft = document.querySelector('.arrow-left');
const arrowRight = document.querySelector('.arrow-right');
const slidersUl = document.getElementById('sliders-ul');
let count = 1;

arrowLeft.addEventListener('click', () => {
    // console.log("================= click left arrow");
    slidersUl.style.transform = `translateX(-100vw)`;
     window.setTimeout(function(){
        arrowLeft.classList.toggle('hidden');
        arrowRight.classList.toggle('hidden'); 
     }, 1000);
});


arrowRight.addEventListener('click', () => {
    // console.log("================= click right arrow");
    slidersUl.style.transform = `translateX(0)`;
    window.setTimeout(function(){
        arrowLeft.classList.toggle('hidden');
        arrowRight.classList.toggle('hidden'); 
    }, 1000);
});




