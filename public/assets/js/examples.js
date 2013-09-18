var randomBite;

function showRandomBite() {
	// empty the div
	$('#randombite').html();
	// load all the data
	var myUrl = "http://astrocast.heroku.com/bites";
	$.getJSON(myUrl, function (bites) {
		// print a random bite
		generateRandomBite(bites);
	});
	var contents = randomBite;
	console.log('contents: ', contents);
	$('#randombite').append(contents);
}

function generateRandomBite(bites) {
	var count = Object.keys(bites);
	console.log('count: ', count);
	// pick a random index
	var index = Math.floor(Math.random() * (count + 1));
	randomBite = bites[index].name;
	console.log('randomBite: ', randomBite);
}

function makeSearchLink() {
	var contents = 'show some google search link here';
	$('#searchlink').append(contents);
}

$(document).ready(function() {

		showRandomBite();
		makeSearchLink();

});
