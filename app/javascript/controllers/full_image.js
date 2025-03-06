document.addEventListener("turbo:load", function() {
  var modal = document.getElementById("image-modal");
  var img = document.getElementById("image-to-enlarge");
  var modalImg = document.getElementById("img-modal");
  var captionText = document.getElementById("caption");
  var closeBtn = document.getElementById("modal-close");

  img.onclick = function() {
    modal.style.display = "flex"; // Center modal
    modal.classList.add("show-modal");
    modalImg.src = this.src;
  };

  closeBtn.onclick = function() {
    modal.classList.remove("show-modal");
    setTimeout(() => { modal.style.display = "none"; }, 300);
  };

  window.onclick = function(event) {
    if (event.target === modal) {
      modal.classList.remove("show-modal");
      setTimeout(() => { modal.style.display = "none"; }, 300);
    }
  };
});
