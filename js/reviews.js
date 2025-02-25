function getUserReviews() {
    fetch("../mal/get_review.php") 
        .then((response) => response.json())
        .then((data) => {
            const reviewsContainer = document.getElementById("user-reviews");
            reviewsContainer.innerHTML = "";
            
            data.reviews.forEach((review) => {
                const reviewScore = review.review_score !== null ? review.review_score + "/10" : "<br> Not scored";
                
                reviewsContainer.innerHTML += `
                    <div class="review-block">
                            <div class="review-left">
                                <div class="user-info">
                                    <img src="../img/${review.user_avatar}" alt="${review.username}'s avatar" class="avatar-img">
                                    <p class="review-username">${review.username}</p>
                                    <div class="review-score">
                                        <p class="review-score"><i class="fa-solid fa-star"></i> ${reviewScore }</p>
                                    </div>
                                </div>
                            </div>
                            <div class="review-content">
                                <p class="review-title">${review.title}</p>
                                <p class="review-text"><em>${review.review_text}</em></p>
                            </div>
                        </div>
                    </div>
                `;
            });
        })
        .catch((error) => {
            console.error("Error fetching user reviews: ", error);
        });
}

document.addEventListener('DOMContentLoaded', () => {
    getUserReviews(); 
});
