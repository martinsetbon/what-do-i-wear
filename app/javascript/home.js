document.addEventListener("turbo:load", function () {
  const title = document.querySelector(".title-home");

  if (title) {
    title.classList.remove("done"); // Reset animation
    void title.offsetWidth; // Force reflow to restart animation

    title.addEventListener("animationend", function () {
      title.classList.add("done"); // Instantly remove blinking cursor
    }, { once: true }); // Ensures this runs only once per animation
  }
});
