
function showRandomBite() {
	// empty the div
	// load all the data
	// print a random bite
	// create a button that, when clicked, displays another random bite
	var contents = 'show some random bite here';
	$('#randombite').append(contents);
}

function makeSearchLink() {
	var contents = 'show some google search link here';
	$('#searchlink').append(contents);
}

$(document).ready(function() {

		showRandomBite();
		makeSearchLink();

});
