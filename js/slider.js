(function() {

	var slideTimer;

	var slides = document.getElementById("slides").getElementsByClassName("slide");
	var services = document.getElementById("services").getElementsByClassName("service");

	var slideCount = slides.length;
	var activeSlide = 0;


	function resetTimer() {
		clearInterval(slideTimer);
		slideTimer = setInterval(nextSlide, 10000);
	}


	function setActiveSlide(number) {

		for(var i=0; i < slideCount; i++){
			slides[i].classList.remove("active");
			services[i].classList.remove("active");
		}

		slides[number].classList.add("active");
		services[number].classList.add("active");

		activeSlide = number;
	}

	function nextSlide() {

		if (activeSlide >= slideCount - 1) {
			setActiveSlide(0);
		} else {
			setActiveSlide(activeSlide + 1);
		}
	}

	function clickService(clicked) {

		number = Array.prototype.indexOf.call(services, clicked);
		setActiveSlide(number);

		resetTimer();
	}

	function init() {
		for (var i = 0; i < slideCount; i++) {
		    services[i].addEventListener("click", function(){ clickService(this) }, true);
		}

		resetTimer();
	}

	init();
})();