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
        <div class="header-left-button">Home</div>
        <div class="header-left-button" onclick="goToWholeList()">List</div>
        <div class="header-left-button" onclick="goToReviews()">Reviews</div>
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
      <div class="slide"><img src="../img/slider1.png" alt="Placeholder">
        <p>Kininatteru Hito ga Otoko ja Nakatta will get anime adaptation!</p>
      </div>
      <div class="slide"><img src="../img/slider2.png" alt="Placeholder">
        <p>Third season of MF Ghost is comming!
      </div>
      <div class="slide"><img src="../img/slider3.png" alt="Placeholder">
        <p>Second season of Bocchi the Rock announced!</p>
      </div>
    </div>
    <div class="control prev">&#9665;</div>
    <div class="control next">&#9655;</div>
  </section>
  <section class="main-section">
    <div class="main-divide" id="main-left">
          Celuję se w łeb pistoletem na wodę
      Pełnym moich łez, serio robię co mogę
      By nie ciągnąć Cię w dół
      Nie ciągnąć Cię w dół
      Celuję se w łeb pistoletem na wodę
      Pełnym moich łez, serio robię co mogę
      By nie ciągnąć Cię w dół
      Nie ciągnąć Cię w dół

      Przeważnie czuję się jak bohater
      Komedii słabej
      Któremu nie wychodzi nic i w sumie to jest żartem
      Śmiechu warte (moje życie)
      Nie zadowala mnie już jakiś czas
      Gdy się zbieram do zmian kopie mnie w twarz
      (Kopie mnie w twarz)
      W mojej głowie blizny nie dają mi chwili nawet bez natłoku myśli
      Że jestem powodem niepowodzeń
      Zmieniam w trudne to co proste
      I mam dość wiem
      To mój pożegnalny list

      Celuję se w łeb pistoletem na wodę
      Pełnym moich łez, serio robię co mogę
      By nie ciągnąć Cię w dół
      Nie ciągnąć Cię w dół

      Jedyne czego chcę to Twój uśmiech
      A mam wrażenie, że Ci daję tylko łzy i te puste obietnice
      Że jeszcze kiedyś wrócę stary ja
      Odbiję się od dna
      Mam wiele cech, których nie lubię
      Wiele słów, których żałuję
      A Ty wiesz o tym wszystkim i wciąż jesteś tu
      Mam wiele cech, których nie lubię
      Wiele słów, których żałuję
      A Ty wiesz o tym wszystkim i wciąż jesteś tu

      Nie kocha Ciebie a to kim byłeś
      I nie powie tego głośno póki żyjesz
      Nie mówię tego po to byś czuł się winien
      Łzy się staną winem

      Jeśli to słyszysz
      Jeśli to słyszysz
      Jeśli to słyszysz to znaczy, że nie żyje
      Rozczarowanie, którym nie chciałem ale byłem

      To mój pożegnalny list

      Celuję se w łeb pistoletem na wodę
      Pełnym moich łez, serio robię co mogę
      By nie ciągnąć Cię w dół
      Nie ciągnąć Cię w dół
      Nie ciągnąć Cię w dół
      To mój pożegnalny list
    </div>
    <div class="main-divide" id="main-right">
        <img src="../img/stopa.png" id="main-img">
    </div>
  </section>
  <script src="../js/standard.js"></script>
  <script src="../js/slider.js"></script>
</body>

</html>