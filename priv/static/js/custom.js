function load(searchString, callback) {
  $.post("/search", {searchString: searchString}, function(data) {
    $('#talks').empty();
    var talks = data.map(callback);
    $('#talks').append(talks);
  });
}

function link_to(transcript) {
  return '/talks/' + transcript.id;
}

function createTalk(transcript) {
  var titleLink = $('<a>').attr('href', link_to(transcript)).html(transcript.title);
  var title = $('<h2>').html(titleLink);
  var talk = $('<div>').addClass('talk');
  var speaker = $('<h2>').html(transcript.speaker);
  var teaser = $('<p>').html(transcript.teaser);

  talk.append([title, speaker, teaser]);
  return talk;
}

$(document).ready(function() {
  load("", createTalk);

  $('#search-field').keydown(function(){
    var text = $('#search-field').val();
    load(text, createTalk);
  });
});
