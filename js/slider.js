document.addEventListener("DOMContentLoaded", () => {
  const sliderWrapper = document.querySelector(".slider-wrapper");
  const slides = document.querySelectorAll(".slide");
  const prev = document.querySelector(".prev");
  const next = document.querySelector(".next");
  let index = 1;
  let autoSlideInterval;

  function startAutoSlide() {
      clearInterval(autoSlideInterval);
      autoSlideInterval = setInterval(nextSlide, 8000);
  }

  // Clone first and last slides
  const firstClone = slides[0].cloneNode(true);
  const lastClone = slides[slides.length - 1].cloneNode(true);

  sliderWrapper.appendChild(firstClone);
  sliderWrapper.insertBefore(lastClone, slides[0]);
  
  const allSlides = document.querySelectorAll(".slide");
  sliderWrapper.style.transform = `translateX(-${100 * index}%)`;
  
  function updateSlide() {
      sliderWrapper.style.transition = "transform 0.5s ease-in-out";
      sliderWrapper.style.transform = `translateX(-${100 * index}%)`;
  }
  
  function nextSlide() {
      if (index >= allSlides.length - 1) return;
      index++;
      updateSlide();
      setTimeout(() => {
          if (index === allSlides.length - 1) {
              sliderWrapper.style.transition = "none";
              index = 1;
              sliderWrapper.style.transform = `translateX(-${100 * index}%)`;
          }
      }, 500);
  }
  
  function prevSlide() {
      if (index <= 0) return;
      index--;
      updateSlide();
      setTimeout(() => {
          if (index === 0) {
              sliderWrapper.style.transition = "none";
              index = allSlides.length - 2;
              sliderWrapper.style.transform = `translateX(-${100 * index}%)`;
          }
      }, 500);
  }
  
  next.addEventListener("click", () => {
      nextSlide();
      startAutoSlide();
  });
  prev.addEventListener("click", () => {
      prevSlide();
      startAutoSlide();
  });
  
  startAutoSlide(); // Start auto-slide initially
});