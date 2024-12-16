document.addEventListener("DOMContentLoaded", function () {
  const menuButton = document.getElementById("menuButton");
  const menuOptions = document.getElementById("menuOptions");

  if (menuButton && menuOptions) {
    menuButton.addEventListener("click", function () {
      // Basculer l'affichage du menu
      menuOptions.style.display =
        menuOptions.style.display === "block" ? "none" : "block";
    });
  }
});
