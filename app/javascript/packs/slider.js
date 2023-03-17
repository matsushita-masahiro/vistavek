        // const slideCotainer = document.querySelector('.show-container');
        // const slide = document.querySelector('.slides');
        // const nextBtn = document.getElementById('next-btn');
        // const prevBtn = document.getElementById('prev-btn');
        // const interval = 2000;
        // console.log("------------------------- slider js");

        // let slides = document.querySelectorAll('.slide');
        // let index = 1;
        // let slideId;

        // const firstClone = slides[0].cloneNode(true);
        // const lastClone = slides[slides.length -1].cloneNode(true);
        // console.log("------------------------- firstClone =" + firstClone );

        // firstClone.id = 'first-clone';
        // lastClone.id = 'last-clone';

        // slide.append(firstClone);
        // slide.prepend(lastClone);

        // const slideWidth = slides[index].clientWidth;
        // // console.log(slideWidth)
        // slide.style.transform = `translateX(${-slideWidth * index}px)`;

        // const startSlide = ()=>{
        //     slideId = setInterval(() => {
        //         moveToNextslide();
        //     }, interval);
        // };

        // const getSlides = () => document.querySelectorAll('.slide');


        // slide.addEventListener('transitionend', ()=>{
        //       slides = getSlides();
        //     if (slides[index].id === firstClone.id){
        //       slide.style.transition = 'none';
        //       index = 1;
        //       slide.style.transform = `translateX(${-slideWidth * index}px)`;
        //     }
        //     if (slides[index].id === lastClone.id){
        //       slide.style.transition = 'none';
        //       index = slides.length - 2;
        //       slide.style.transform = `translateX(${-slideWidth * index}px)`;
        //     }
        // });

        // const moveToNextslide = () => {
        //      slides = getSlides();
        //      if(index >= slides.length -1) return;
        //     index++;
        //     slide.style.transform = `translateX(${-slideWidth * index}px)`;
        //     slide.style.transition = '.7s';
        // };

        // const moveToPreviousSlide = () => {
        //     if(index <= 0) return;
        //     index--;
        //     slide.style.transform = `translateX(${-slideWidth * index}px)`;
        //     slide.style.transition = '.7s';
        // };

        // slideCotainer.addEventListener('mouseenter', () => {
        //     clearInterval(slideId);
        // });
        // slideCotainer.addEventListener('mouseleave', startSlide);

        // nextBtn.addEventListener('click', moveToNextslide);
        // prevBtn.addEventListener('click', moveToPreviousSlide);
        // startSlide();