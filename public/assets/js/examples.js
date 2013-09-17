
function showRandomBite() {
	// empty the div
	$('#randombite').html();
	// load all the data
	var myUrl = "http://astrocast.heroku.com/bites";
	$.getJSON(myUrl, function (bites) {
		// print a random bite
		generateRandomBite(bites);
	});
	var contents = 'show some random bite here';
	$('#randombite').append(contents);
}

function generateRandomBite(bites) {
	console.log(bites);
}

function makeSearchLink() {
	var contents = 'show some google search link here';
	$('#searchlink').append(contents);
}

$(document).ready(function() {

		showRandomBite();
		makeSearchLink();

});
