<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login</title>

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
    rel="stylesheet" />

  <link rel="stylesheet" href="../css/standard.css" />
  <link rel="stylesheet" href="../css/login.css" />
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
        <div class="login-button">Login</div>
        <div class="signup-button" onclick="goToSignup()">Sign Up</div>
        <div id="dark-mode-button">Dark mode</div>
      </div>
    </section>

    <section class="header-main">
      <div class="header-main-left">
        <div class="header-left-button" onclick="goToHome()">Home</div>
        <div class="header-left-button" onclick="goToWholeList()">List</div>
        <div class=" header-left-button" onclick="goToReviews()">Reviews</div>
      </div>
      <div class="header-searchbar">
        <form>
          <form>
            <input type="text" class="searchbar" id="searchbar" name="searchbar" placeholder="Search for anime" />
            <input type="submit" class="searchbar-button" value="Search" />
          </form>
      </div>
    </section>
  </header>
  <section class="main-body">
    <section class="login-main">
      <form class="login" action="/sigma/mal/index.php" method="post">
        <p>Username</p>
        <input type="textbox" id="username" name="username" />
        <p>Password</p>
        <input type="password" id="password" name="pass" />
        <div id="show-password-container">
          <input type="checkbox" id="show-password" onclick="showBtn()" />
          <p>Show password</p>
        </div>
        <button type="submit" class="login-button" id="login-button" name="submit_login">Login</button>
        <div class="signup-button" id="signup-button" onclick="goToSignup()">
          Sign up
        </div>
      </form>
    </section>
  </section>
  <footer></footer>
</body>
<script>
  function showBtn() {
    var showPass = document.getElementById("password");
    if (showPass.type == "password") {
      showPass.type = "text";
    } else {
      showPass.type = "password";
    }
  }
</script>
<script src="../js/standard.js"></script>

</html>