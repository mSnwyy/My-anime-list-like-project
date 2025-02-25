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
  <link rel="stylesheet" href="../css/reviews.css" />
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
        <div class="header-left-button">Reviews</div>
      </div>
      <div class="header-searchbar">
        <form>
          <input type="text" class="searchbar" id="searchbar" name="searchbar" placeholder="Search for anime" />
          <input type="submit" class="searchbar-button" value="Search" />
        </form>
      </div>
    </section>
  </header>
    <section id="user-reviews" class="user-reviews">
    </section>
  <script src="../js/standard.js"></script>
  <script src="../js/reviews.js"></script>
</body>

</html>