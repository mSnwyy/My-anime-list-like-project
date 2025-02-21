let progress = [4, 84 , 15 , 12 , 802];
let total = progress.reduce((acc, current) => acc + current, 0);

let watchingBar = document.getElementById('watching');
let completedBar = document.getElementById('completed');
let droppedBar = document.getElementById('dropped');
let onHoldBar = document.getElementById('on-hold');
let planToWatchBar = document.getElementById('plan-to-watch');

watchingBar.style.width = progress[0] + "%";
completedBar.style.width = progress[1] + "%";
droppedBar.style.width = progress[2] + "%";
onHoldBar.style.width = progress[3] + "%";
planToWatchBar.style.width = progress[4] + "%";

document.getElementById('user-anime-on-list').innerHTML = "Anime on your list: " + total;