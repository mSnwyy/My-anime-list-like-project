 (function () {
  const isDark = localStorage.getItem("darkMode") === "enabled";
  if (isDark) {
      document.documentElement.style.setProperty("--background-color", "#1a3a3a");
      document.documentElement.style.setProperty("--font-color", "#FFFFFF");
      document.documentElement.style.setProperty("--font-color-fix", "#000000");
      document.documentElement.style.setProperty("--searchbar-color", "#2e6868");
      document.documentElement.style.setProperty("--shadow-color", "rgb(30, 71, 71)");
      document.documentElement.style.setProperty("--shadow-color-fix", "rgb(39, 94, 94)");
      document.documentElement.style.setProperty("--accent-color-fix", "#151a80");
  }
})();

document.addEventListener("DOMContentLoaded", function () {
  const darkModeBtn = document.getElementById("dark-mode-button");
  const root = document.documentElement;

  function setDarkMode(isDark) {
      if (isDark) {
          root.style.setProperty("--background-color", "#1a3a3a");
          root.style.setProperty("--font-color", "#FFFFFF");
          root.style.setProperty("--font-color-fix", "#000000");
          root.style.setProperty("--searchbar-color", "#2e6868");
          root.style.setProperty("--shadow-color", "rgb(30, 71, 71)");
          root.style.setProperty("--shadow-color-fix", "rgb(39, 94, 94)");
          root.style.setProperty("--accent-color-fix", "#151a80");
          darkModeBtn.style.backgroundColor = "#FFFFFF";
          darkModeBtn.style.color = "#1a3a3a";
          darkModeBtn.textContent = "Light Mode";
          localStorage.setItem("darkMode", "enabled");
      } else {
          root.style.setProperty("--background-color", "#FFFFFF");
          root.style.setProperty("--font-color", "#000000");
          root.style.setProperty("--font-color-fix", "#FFFFFF");
          root.style.setProperty("--searchbar-color", "#FFFFFF");
          root.style.setProperty("--shadow-color", "#d4cfcf");
          root.style.setProperty("--shadow-color-fix", "#ffffff");
          root.style.setProperty("--accent-color-fix", "#a997df");
          darkModeBtn.style.backgroundColor = "#1a3a3a";
          darkModeBtn.style.color = "#FFFFFF";
          darkModeBtn.textContent = "Dark Mode";
          localStorage.setItem("darkMode", "disabled");
      }
  }

  const darkModeStatus = localStorage.getItem("darkMode");
  setDarkMode(darkModeStatus === "enabled");

  setTimeout(() => {
      root.style.transition = "background-color 1s, color 1s";
  }, 10);

  darkModeBtn.addEventListener("click", function () {
      const isDark = localStorage.getItem("darkMode") === "enabled";
      setDarkMode(!isDark);
  });
});


function goToLogin() {
  window.location.href = "../html/login.php";
}
function goToHome() {
  window.location.href = "../html/index.php";
}
function goToSignup() {
  window.location.href = "../html/signin.php";
}
function goToUser() {
  window.location.href = "../html/user.php";
}
function goToList() {
  window.location.href = "../html/anime_list.php";
}
function goToWholeList() {
  window.location.href = "../html/all_anime_list.php";
}
function goToEditUser() {
  window.location.href = "../html/edit_user.php";
}
function goToReviews() {
  window.location.href = "../html/reviews.php";
}

document.addEventListener("DOMContentLoaded", function () {
  checkLoginStatus();
});

function checkLoginStatus() {
  fetch("../mal/check_login.php")
    .then((response) => response.json())
    .then((data) => {
      if (data !== "not_logged_in") {
        document.getElementById("loginButton").textContent = "Logout";
        document
          .getElementById("loginButton")
          .setAttribute("onclick", "logoutUser()");
        document.getElementById("signupButton").style.display = "none";
        let userListButton = document.getElementById("user-list-button");
        if (userListButton !== null) {
          userListButton.style.display = "block";
        }
        let editUserButton = document.getElementById("edit-user-button");
        if (editUserButton !== null) {
          editUserButton.style.display = "block";
        }
        
        if (document.getElementById("header-user-nickname") !== null) {
        document.getElementById("header-user-nickname").innerHTML =
          data.username;
        }
        if (document.getElementById("user-nickname") !== null) {
        document.getElementById("user-nickname").innerHTML = data.username;
        }
        const date = new Date(data.created_at);
        if (date !== null){
          const formattedDate = date.toLocaleDateString();
          if (document.getElementById("user-created-date") !== null){
           document.getElementById("user-created-date").innerHTML =
              "Joined: <br>" + formattedDate;
          }
        }
      } else {
        console.log("User is not logged in.");
      }
    })
    .catch((error) => {
      console.error("Error while checking login status: ", error);
    });
}

function logoutUser() {
  fetch("../mal/logout.php")
    .then((response) => response.text())
    .then((data) => {
      if (data === "logged_out") {
        location.reload();
      }
    })
    .catch((error) => {
      console.error("Error while logging out: ", error);
    });
}

document.addEventListener("DOMContentLoaded", function () {
  const searchInput = document.getElementById("searchbar");
  const resultsContainer = document.createElement("div");
  resultsContainer.classList.add("search-results");
  searchInput.parentNode.appendChild(resultsContainer);

  searchInput.addEventListener("input", function () {
    const query = searchInput.value.trim();

    if (query.length === 0) {
      resultsContainer.innerHTML = "";
      return;
    }

    fetch(`../mal/search.php?query=${encodeURIComponent(query)}`)
      .then((response) => response.json())
      .then((data) => {
        resultsContainer.innerHTML = "";
        if (data.length > 0) {
          data.forEach((anime) => {
            const animeItem = document.createElement("div");
            animeItem.classList.add("search-result-item");

            const animeLink = document.createElement("a");
            animeLink.href = `../mal/anime_details.php?id=${anime.id}`;
            animeLink.textContent = anime.title;
            animeLink.classList.add("anime-link");

            animeItem.appendChild(animeLink);
            resultsContainer.appendChild(animeItem);
          });
        } else {
          resultsContainer.innerHTML =
            "<div class='search-result-item'>No results found</div>";
        }
      })
      .catch((error) => console.error("Error fetching search results:", error));
  });

  document.addEventListener("click", function (event) {
    if (
      !searchInput.contains(event.target) &&
      !resultsContainer.contains(event.target)
    ) {
      resultsContainer.innerHTML = "";
    }
  });
});
