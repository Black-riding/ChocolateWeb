let currentIndex = 0;
  const slides = document.querySelectorAll('.image-slide');

  function changeImage(step) {
    slides[currentIndex].classList.remove('active');
    currentIndex = (currentIndex + step + slides.length) % slides.length;
    slides[currentIndex].classList.add('active');
  }

  // 初始化第一張圖
  document.addEventListener('DOMContentLoaded', () => {
    slides[0].classList.add('active');
  });