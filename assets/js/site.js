// Light/dark theme toggle. Light is the default; dark is opt-in. The saved choice is applied early by an inline script in <head>.
(function () {
  "use strict";
  var root = document.documentElement;
  var button = document.querySelector(".theme-toggle");
  if (!button) return;

  function current() {
    return root.dataset.theme === "dark" ? "dark" : "light";
  }

  button.addEventListener("click", function () {
    var next = current() === "dark" ? "light" : "dark";
    root.dataset.theme = next;
    try { localStorage.setItem("theme", next); } catch (e) {}
  });
})();
