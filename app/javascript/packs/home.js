console.log("================= home.js");

const arrowLeft = document.querySelector('.arrow-left');
const arrowRight = document.querySelector('.arrow-right');
const slidersUl = document.getElementById('sliders-ul');
let count = 1;

arrowLeft.addEventListener('click', () => {
    console.log("================= click left arrow");
    slidersUl.style.transform = `translateX(-100vw)`;
     window.setTimeout(function(){
        arrowLeft.classList.toggle('hidden');
        arrowRight.classList.toggle('hidden'); 
     }, 1000);   
    // window.setTimeout(function(){
    //     if(count%2 == 1){
    //       slidersUl.innerHTML = "<li class='view-more-li-flex'><div class='view-more-li-text'><p>法人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/afbe224.png' class='view-more-image'></div></li><li class='view-more-li-flex'><div class='view-more-li-text'><p>個人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/cb2a3.png' class='view-more-image'></div></li><li class='view-more-li-flex'><div class='view-more-li-text'><p>法人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/afbe224.png' class='view-more-image'></div></li>";
    //     } else {
    //       slidersUl.innerHTML = "<li class='view-more-li-flex'><div class='view-more-li-text'><p>個人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/cb2a3.png' class='view-more-image'></div></li><li class='view-more-li-flex'><div class='view-more-li-text'><p>法人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/afbe224.png' class='view-more-image'></div></li><li class='view-more-li-flex'><div class='view-more-li-text'><p>個人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/cb2a3.png' class='view-more-image'></div></li>";
    //     } 
    //     count++;
    //     slidersUl.style.transform = `translateX(0)`;
    // }, 1000);

    // count++;
});


arrowRight.addEventListener('click', () => {
    console.log("================= click right arrow");
    slidersUl.style.transform = `translateX(0)`;
    window.setTimeout(function(){
        arrowLeft.classList.toggle('hidden');
        arrowRight.classList.toggle('hidden'); 
    }, 1000);
//     if(count%2 == 1){
//       slidersUl.innerHTML = "<li class='view-more-li-flex'><div class='view-more-li-text'><p>法人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/afbe224.png' class='view-more-image'></div></li><li class='view-more-li-flex'><div class='view-more-li-text'><p>個人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/cb2a3.png' class='view-more-image'></div></li><li class='view-more-li-flex'><div class='view-more-li-text'><p>法人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/cb2a3.png' class='view-more-image'></div></li>";
//     } else {
//       slidersUl.innerHTML = "<li class='view-more-li-flex'><div class='view-more-li-text'><p>個人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/cb2a3.png' class='view-more-image'></div></li><li class='view-more-li-flex'><div class='view-more-li-text'><p>法人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/afbe224.png' class='view-more-image'></div></li><li class='view-more-li-flex'><div class='view-more-li-text'><p>個人様向け</p><div class='view-more-link'><a href='/services'>VIEW MORE</a></div></div><div class='view-more-image-cover'><img src='/image/home/afbe224.png' class='view-more-image'></div></li>";
//     }
//     count++;
    
});




