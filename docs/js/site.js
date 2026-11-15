// Mobile menu toggle and "back to top" button.
(function () {
  "use strict";

  var toggle = document.querySelector(".menu-toggle");
  if (toggle) {
    var icon = toggle.querySelector(".icon");
    toggle.addEventListener("click", function () {
      var expanded = toggle.getAttribute("aria-expanded") === "true";
      toggle.setAttribute("aria-expanded", String(!expanded));
      document.querySelectorAll(".site-menu, .social-menu").forEach(function (el) {
        el.classList.toggle("collapsed");
      });
      icon.classList.toggle("icon-menu");
      icon.classList.toggle("icon-close");
    });
  }

  var toTop = document.querySelector(".to-top");
  if (toTop) {
    var ticking = false;
    window.addEventListener("scroll", function () {
      if (ticking) return;
      ticking = true;
      window.requestAnimationFrame(function () {
        toTop.classList.toggle("is-hide", window.scrollY < 600);
        ticking = false;
      });
    }, { passive: true });
    toTop.addEventListener("click", function (e) {
      e.preventDefault();
      window.scrollTo({ top: 0, behavior: "smooth" });
    });
  }
})();
