var swiper = new Swiper(".swiper", {
    spaceBetween: 30, 
    loop: true,
    speed: 7000,    
    slidesPerView: "auto", 
//    freeMode: true,
    autoplay: {
        delay: 0,
        disableOnInteraction: false, 
    },
});






document.addEventListener('DOMContentLoaded', () => {
 
let lastScrollY = window.scrollY;
const swiperContainer = document.getElementById('mainHeader');
swiperContainer.style.transition = 'transform 0.5s ease-out';
window.addEventListener('scroll', () => {
    const currentScrollY = window.scrollY;

    if (currentScrollY > lastScrollY && currentScrollY > 50) {
        swiperContainer.classList.add('translate-y-[-100%]');
        swiperContainer.classList.remove('translate-y-0');
    } else {
       swiperContainer.classList.add('translate-y-0');
        swiperContainer.classList.remove('translate-y-[-100%]');
    }

    lastScrollY = currentScrollY;
});
});