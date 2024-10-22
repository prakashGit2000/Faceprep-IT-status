const cards = document.querySelectorAll('.card');
const nextButton = document.getElementById('next-button');
const prevButton = document.getElementById('prev-button');

let currentIndex = 2; // Start with the third card

nextButton.addEventListener('click', () => {
  currentIndex += 3;
  if (currentIndex >= cards.length) {
    currentIndex = cards.length - 1;
  }
  updateCardVisibility();
});

prevButton.addEventListener('click', () => {
  currentIndex -= 3;
  if (currentIndex < 0) {
    currentIndex = 2;
  }
  updateCardVisibility();
});

function updateCardVisibility() {
  for (let i = 0; i < cards.length; i++) {
    if (i >= currentIndex - 2 && i <= currentIndex) {
      cards[i].style.display = 'block';
    } else {
      cards[i].style.display = 'none';
    }
  }
}