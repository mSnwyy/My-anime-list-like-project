function getUserAnimeStats() {
    fetch("../mal/get_user_anime_stats.php")
      .then((response) => response.json())
      .then((data) => {
        if (!data.error) {
            let watching = data.Watching;
            let completed = data.Completed;
            let dropped = data.Dropped;
            let onHold = data["On-hold"];
            let planToWatch = data["Plan to watch"];
            let averageScore = data["Average Score"]; // Pobranie średniej ocen

            let progress = [watching, completed , dropped , onHold , planToWatch];
            let total = progress.reduce((acc, current) => acc + current, 0);

            let watchingBar = document.getElementById('watching');
            let completedBar = document.getElementById('completed');
            let droppedBar = document.getElementById('dropped');
            let onHoldBar = document.getElementById('on-hold');
            let planToWatchBar = document.getElementById('plan-to-watch');

            if (total > 0) {
                watchingBar.style.width = (progress[0] / total * 100) + "%";
                completedBar.style.width = (progress[1] / total * 100) + "%";
                droppedBar.style.width = (progress[2] / total * 100) + "%";
                onHoldBar.style.width = (progress[3] / total * 100) + "%";
                planToWatchBar.style.width = (progress[4] / total * 100) + "%";
            } else {
                watchingBar.style.width = "0%";
                completedBar.style.width = "0%";
                droppedBar.style.width = "0%";
                onHoldBar.style.width = "0%";
                planToWatchBar.style.width = "0%";
            }

            document.getElementById('user-anime-on-list').innerHTML = "Anime on your list: " + total;
            document.getElementById('watching-text').innerHTML = "Watching: " + progress[0];
            document.getElementById('completed-text').innerHTML = "Completed: " + progress[1];
            document.getElementById('dropped-text').innerHTML = "Dropped: " + progress[2];
            document.getElementById('on-hold-text').innerHTML = "On hold: " + progress[3];
            document.getElementById('plan-to-watch-text').innerHTML = "Plan to watch: " + progress[4];

            document.getElementById('user-average-score').innerHTML = "Average Score: <br>" + averageScore;
        } else {
          console.log("User is not logged in.");
        }
      })
      .catch((error) => {
        console.error("Error fetching user anime stats: ", error);
      });
}

document.addEventListener("DOMContentLoaded", getUserAnimeStats);

function getUserAnimeLists() {
    fetch("../mal/get_user_top_anime.php")
        .then((response) => response.json())
        .then((data) => {
            if (!data.error) {
                const topAnimeContainer = document.getElementById("user-favourite");
                topAnimeContainer.innerHTML = ""; 
                data.topAnime.forEach(anime => {
                    topAnimeContainer.innerHTML += `
                        <div class="anime-block">
                            <div class="anime-content">
                                <a href="../mal/anime_details.php?id=${anime.id}"> <img src="${anime.image_url}" alt="${anime.title}" class="anime-image"> </a>
                                <p> ${anime.title}</p>
                            </div>
                        </div>
                    `;
                });

                const recentAnimeContainer = document.getElementById("user-last-watch");
                recentAnimeContainer.innerHTML = ""; 
                data.recentAnime.forEach(anime => {
                    recentAnimeContainer.innerHTML += `
                        <div class="anime-block">
                            <div class="anime-content">
                                <a href="../mal/anime_details.php?id=${anime.id}"> <img src="${anime.image_url}" alt="${anime.title}" class="anime-image"> </a>
                                <p> ${anime.title}</p>
                            </div>
                        </div>
                    `;
                });

            } else {
                console.log("User is not logged in.");
            }
        })
        .catch((error) => {
            console.error("Error fetching user anime lists: ", error);
        });
}

document.addEventListener("DOMContentLoaded", getUserAnimeLists);

function getUserProfile() {
    fetch("../mal/get_user_profile.php")
        .then(response => response.json())
        .then(data => {
            if (!data.error) {
                document.getElementById("avatar").src = "../img/" + data.user_avatar;

                let userProfile = document.getElementById("user-main-profile");
                userProfile.innerHTML = `<p>${data.user_desc}</p>`;
            } else {
                console.log("Error:", data.error);
            }
        })
        .catch(error => {
            console.error("Error fetching user profile:", error);
        });
}

// Uruchomienie funkcji po załadowaniu strony
document.addEventListener("DOMContentLoaded", getUserProfile);

