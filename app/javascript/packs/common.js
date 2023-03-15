
console.log("================= common.js");

const header = document.getElementById('header');

window.addEventListener('scroll', ()=> {
    let y = window.pageYOffset;
    if( y >= 400 ) {
        console.log("400超え");
        header.style.transform = "translateY(-70px)";
    } else {
        console.log("400未満");
        header.style.transform = "translateY(0px)";
    }
});

const toggle = document.querySelector(".toggle");
const overlay = document.getElementById("overlay");

toggle.addEventListener('click', () => {
    toggle.classList.toggle('active');
    overlay.classList.toggle('hidden');
    overlay.classList.toggle('sp-overlay');
});