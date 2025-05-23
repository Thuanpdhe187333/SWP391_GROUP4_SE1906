document.addEventListener("DOMContentLoaded", function () {
    const ratingButtons = document.querySelectorAll(".rating-emoji");
    const feedbackText = document.querySelector("textarea");
    const submitButton = document.querySelector(".sumbit-btn");
    const popup = document.getElementById("popup");

    ratingButtons.forEach(button => {
        button.addEventListener("click", function () {
            ratingButtons.forEach(btn => btn.classList.remove("selected"));
            this.classList.add("selected");
        });
    });

    submitButton.addEventListener("click", function () {
        if (!document.querySelector(".selected")) {
            alert("Please select a rating!");
            return;
        }
        popup.style.display = "block";
    });

    function closePopup() {
        popup.style.display = "none";
    }

    document.querySelector(".popup-content button").addEventListener("click", closePopup);
});