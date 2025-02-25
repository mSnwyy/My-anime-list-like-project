<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>MyAnimeList</title>

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
  <script src="https://kit.fontawesome.com/10e02d8f72.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="../css/standard.css" />
  <link rel="stylesheet" href="../css/user.css" />
  <?php include "../mal/index.php"; ?>
</head>

<body>
  <header>
    <section class="header-logo">
        <div class="header-logo-image">
          <img src="../img/logo.png">
        </div>
      <div class="header-logo-right">
        <div class="header-user">
          <div id="header-user-avatar"></div>
          <div id="header-user-nickname" onclick="goToUser()"></div>
        </div>
        <div class="login-button" id="loginButton" onclick="goToLogin()">Login</div>
        <div class="signup-button" id="signupButton" onclick="goToSignup()">Sign Up</div>
        <div id="dark-mode-button">Dark mode</div>
      </div>
    </section>

    <section class="header-main">
      <div class="header-main-left">
        <div class="header-left-button" onclick="goToHome()">Home</div>
        <div class="header-left-button" onclick="goToWholeList()">List</div>
        <div class="header-left-button" onclick="goToReviews()">Reviews</div>
      </div>
      <div class="header-searchbar">
        <form>
          <input type="text" class="searchbar" id="searchbar" name="searchbar" placeholder="Search for anime" />
          <input type="submit" class="searchbar-button" value="Search" />
        </form>
      </div>
    </section>
  </header>
  <section class="user-main">
    <div id="edit-user-button" onclick="goToEditUser()"><i class="fa-solid fa-gear"></i></div>
    <div class="position-fix">
      <div class="user-left">
        <div id="user-avatar" class="user-bento-box">
          <img id="avatar" src="../img/placeholder.png">
        </div>
        <div class="user-bento-box" id="user-info">
          <div id="user-nickname"></div>
          <div id="user-created-date"></div>
          <div id="user-anime-on-list"></div>
          <div id="user-average-score"></div>
        </div>
      </div>
      <div class="user-right-up">
        <div class="user-bento-box" id="user-progress-container">
          <p id="progress-container-text">User's anime progress</p>
          <div id="user-progress-bar">
            <div class="progress-bar-part" id="watching">
              <div class="progress-bar-text" id="watching-text">Watching</div>
            </div>
            <div class="progress-bar-part" id="completed">
              <div class="progress-bar-text" id="completed-text">Completed</div>
            </div>
            <div class="progress-bar-part" id="dropped">
              <div class="progress-bar-text" id="dropped-text">Dropped</div>
            </div>
            <div class="progress-bar-part" id="on-hold">
              <div class="progress-bar-text" id="on-hold-text">On Hold</div>
            </div>
            <div class="progress-bar-part" id="plan-to-watch">
              <div class="progress-bar-text" id="plan-to-watch-text">Plan to Watch</div>
            </div>
          </div>
          <div id="user-list-button" onclick="goToList()">User's anime list</div>
        </div>
        <div class="user-right-down">
          <div class="user-bento-box" id="user-main-profile">
            <p>User don't have an description yet.</p>
          </div>
          <div class="user-right-down-second">
            <div class="user-bento-box" id="user-last-watch">
              <div class="anime-list" id="recent-anime-container"></div>
            </div>
            <div class="user-bento-box" id="user-favourite">
              <div class="anime-list" id="top-anime-container"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <script src="../js/standard.js"></script>
  <script src="../js/user.js"></script>
</body>

</html>