
console.log("================= common.js");

const header = document.getElementById('header');

window.addEventListener('scroll', ()=> {
    let y = window.pageYOffset;
    if( y >= 400 ) {
        header.style.transform = "translateY(-70px)";
    } else {
        header.style.transform = "translateY(0px)";
    }
});

const toggle = document.querySelector(".toggle");
const toggleClose = document.querySelector(".toggle-close");
const overlay = document.getElementById("overlay");
const body = document.querySelector("body");

toggle.addEventListener('click', () => {
    // toggle.classList.toggle('active');
    toggleClose.classList.toggle('toggle');
    toggleClose.classList.toggle('active');
    overlay.classList.toggle('hidden');
    overlay.classList.toggle('sp-overlay');
    body.classList.toggle('mask');
});


toggleClose.addEventListener('click', () => {
    toggleClose.classList.toggle('toggle');
    toggleClose.classList.toggle('active');
    overlay.classList.toggle('hidden');
    overlay.classList.toggle('sp-overlay');
    body.classList.toggle('mask');
});