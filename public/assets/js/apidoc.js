
function apiDoc(title, printTitle, method, url, format, explanation, template) {
	this.title = title;
	this.printTitle = printTitle;
	this.method = method;
	this.url = url;
	this.format = format;
	this.explanation = explanation;
	this.template = template;
}

var bites = new apiDoc('bites','Bites','GET','http://astrocast.heroku.com/bites',  'JSON', 'Returns all the astronomy bites. Each bite has content and an array of tags.', '[{"name" : "Here comes the content of the astronomy bite","tags" : ["astronomy", "bite"], "_id" : "..."}]');

var tags = new apiDoc('tags','Tags','GET','http://astrocast.heroku.com/bites?tags=TAG1,TAG2',  'JSON', 'Returns the astronomy bites tagged TAG1 AND TAG2.', '[{"name" : "Here comes the content of the astronomy bite","tags" : ["TAG1", "TAG2", "another_tag"], "_id" : "..."}]');


function displayAPI(apiname) {
	printApiDoc(apiname);
}

function printApiDoc(apiobj) {
	var json_example;
	if (apiobj.template.length > 0) {
		json_example = vkbeautify.json(apiobj.template);
	}
	else {
		json_example = 'Feature not yet implemented';
	}
	var contents = '<div id="' + apiobj.title + '"><div style="min-height:40px;"></div><h2>' + apiobj.printTitle + '</h2><table class="table"><tr><td colspan="2">' + apiobj.explanation + '</td></tr><tr><td class="leftcell">URL</td><td class="rightcell"><pre>' + apiobj.url + '</pre></td></tr><tr><td class="leftcell">Method</td><td class="rightcell">' + apiobj.method + '</td></tr><tr><td class="leftcell">Format</td><td class="rightcell">' + apiobj.format + '</td></tr><tr><td class="leftcell">Returns</td><td class="rightcell"><pre>' + json_example + '</pre></td></tr></table></div>';
	$('#apimain').append(contents);
}

$(document).ready(function() {

		displayAPI(bites);
		displayAPI(tags);
});
