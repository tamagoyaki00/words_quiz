// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener("turbo:load", () => {
  const form = document.querySelector("form");
  if (!form) return;

  form.addEventListener("submit", (e) => {
    e.preventDefault();  // まず送信を止める

    const correctId = document.getElementById("choices")?.dataset.correct;
    const selected = document.querySelector("input[type='radio']:checked");
  
    const selectedId = selected.value;
    const correctSound = new Audio("/sounds/correct.mp3");
    const wrongSound = new Audio("/sounds/wrong.mp3");

    const sound = selectedId === correctId ? correctSound : wrongSound;

    sound.play();

    // 0.8秒後フォーム送信
    setTimeout(() => {
      form.submit();
    }, 800);
  });
});