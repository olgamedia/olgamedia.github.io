(function() {
	var date = new Date();
	var currentYear = date.getFullYear();
	var currentMonth = date.getMonth();
	var daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();
	var firstDayOfWeek = new Date(currentYear, currentMonth, 1).getDay();
	if(currentMonth == 0) {
		var daysInLastMonth = new Date(currentYear - 1, 12, 0).getDate();
	}else {
		var daysInLastMonth = new Date(currentYear, currentMonth, 0).getDate();
	}

	var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

	var calendar = document.getElementById("calendar");

	calendar.insertAdjacentHTML('afterbegin', '<h3>'+monthNames[currentMonth]+'</h3>');

	count = 0;

	while (count < 35) {
		if (count < firstDayOfWeek) {
			calendar.insertAdjacentHTML('beforeend', '<li class="day oM">'+(daysInLastMonth - firstDayOfWeek + count + 1)+'</li>');
		}else if (count >= daysInMonth + firstDayOfWeek){
			calendar.insertAdjacentHTML('beforeend', '<li class="day oM">'+(count - firstDayOfWeek + 1 - daysInMonth)+'</li>');
		}else {
			calendar.insertAdjacentHTML('beforeend', '<li class="day">'+(count - firstDayOfWeek + 1)+'</li>');
		}
		count++;
	}
})();