// console.log("================= home.js");

const topImage1 = document.getElementById('top-image-1');
const topImage2 = document.getElementById('top-image-2');

let x = 0;
// let timerId = setInterval(() => {
//     console.log("----- x = " + x);
//     if(x%2==0) {
//         topImage1.classList.remove('hidden');
//         topImage2.classList.add('hidden');
//     } else {
//         topImage1.classList.add('hidden');
//         topImage2.classList.remove('hidden');
//     }
//     x++;
    
    
// }, 5000);
    

const topWord = document.getElementById('top-word');
window.addEventListener('load', () => {
    // topWord.classList.add('appear');
    // timerId;
  
});

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

const time = 5000;
const inouttime = 1000;
// jQuery
// window.addEventListener('load', () => {
//     $(function(){
//           $("#top-image-1").fadeIn(500);
//           setTimeout(function(){
//               $("#top-image-1").fadeOut(1000);
//           },3500);
          
         
//       setInterval(function() {
//         x++;
//         // console.log("--------- x = " + x);
//       if(x%2==0) {
//           $("#top-image-1").fadeIn(500);
//           setTimeout(function(){
//               $("#top-image-1").fadeOut(1000);
//           },3500);
//       } else {
//           $("#top-image-2").fadeIn(500);
//           setTimeout(function(){
//               $("#top-image-2").fadeOut(1000);
//           },3500);
//       };
       
//       },5000);
//     });
// });


const imagesLength = $('.top-image').length;
const interval = 10000;
const fadetime = 300;
let showTime = interval - fadetime*2;

window.addEventListener('load', () => {
    $(function(){
          $(".top-image").eq(0).fadeIn(fadetime);
          setTimeout(function(){
               $(".top-image").eq(0).fadeOut(fadetime);
          },showTime);
          
         
      setInterval(function() {
         x++;
        // console.log("--------- x = " + x);
       if(x%imagesLength==0) {
          $(".top-image").eq(0).fadeIn(fadetime);
          setTimeout(function(){
               $(".top-image").eq(0).fadeOut(fadetime);
          },showTime);
       } else if(x%imagesLength==1) {
          $(".top-image").eq(1).fadeIn(fadetime);
          setTimeout(function(){
               $(".top-image").eq(1).fadeOut(fadetime);
          },showTime);
       } else {
          $(".top-image").eq(2).fadeIn(fadetime);
          setTimeout(function(){
               $(".top-image").eq(2).fadeOut(fadetime);
          },showTime);         
       };
       
      },interval);
    });
});




