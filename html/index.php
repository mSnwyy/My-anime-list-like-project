<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>MyAnimeList</title>

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />

  <link rel="stylesheet" href="../css/standard.css" />
  <link rel="stylesheet" href="../css/mainpage.css" />

  <?php include "../mal/index.php"; ?>
</head>

<body>
  <header>
    <section class="header-logo">
      <div class="header-logo-image">placeholder</div>
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
        <div class="header-left-button">Home</div>
        <div class="header-left-button" onclick="goToWholeList()">List</div>
        <div class="header-left-button">News</div>
      </div>
      <div class="header-searchbar">
        <form>
          <input type="text" class="searchbar" id="searchbar" name="searchbar" placeholder="Search for an anime" />
          <input type="submit" class="searchbar-button" value="Search" />
        </form>
      </div>
    </section>
  </header>
  <section class="slider-section">
    <div class="slider-wrapper">
      <div class="slide"><img src="../img/placeholder.png" alt="Placeholder">
        <p>Placeholder</p>
      </div>
      <div class="slide"><img src="../img/placeholder.png" alt="Placeholder">
        <p>Placeholder</p>
      </div>
      <div class="slide"><img src="../img/placeholder.png" alt="Placeholder">
        <p>Placeholder</p>
      </div>
    </div>
    <div class="control prev">&#9665;</div>
    <div class="control next">&#9655;</div>
  </section>

  <footer></footer>

  <script src="../js/standard.js"></script>
  <script src="../js/slider.js"></script>
</body>

</html>