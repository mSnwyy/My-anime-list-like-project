function goToLogin() {
  window.location.href = "../html/login.html";
}
function goToHome() {
  window.location.href = "../html/index.html";
}
function goToSignup() {
  window.location.href = "../html/signin.html";
}
function goToUser() {
  window.location.href = "../html/user.html";
}

const darkModeBtn = document.getElementById('dark-mode-button');
darkModeBtn.addEventListener("click", function () {
  const root = document.documentElement;
  const currentColor = getComputedStyle(root).getPropertyValue("--background-color").trim();
  
  if (currentColor == "#FFFFFF") {
      root.style.setProperty("--background-color", "#1a3a3a");
      root.style.setProperty("--font-color", "#FFFFFF");
      root.style.setProperty("--searchbar-color", "#2e6868");
      darkModeBtn.style.backgroundColor = "#FFFFFF";
      darkModeBtn.style.color = "#1a3a3a";
      darkModeBtn.textContent = "Light Mode";
  } else {
      root.style.setProperty("--background-color", "#FFFFFF");
      root.style.setProperty("--font-color", "#000000");
      root.style.setProperty("--searchbar-color", "#FFFFFF");
      darkModeBtn.style.backgroundColor = "#1a3a3a";
      darkModeBtn.style.color = "#FFFFFF";
      darkModeBtn.textContent = "Dark Mode";
  }

});