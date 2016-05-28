function initializeComments () {
	$("#comment").on("click", function() {
		$.ajax({
			url: window.location.href + "/comments"
		}).done(function(response) {									// get requestas
  		$("#comments-list").html(response);
			$('#comments-list').fadeIn(500);
		});
	});

	$(document).on("click", "#submit-btn", function() {
		$.post( window.location.href + "/comments", { 			//post requestas
			description: $('#comment_description').val()
		}).done(function(response) {
		$("#comments-list").html(response);
  	});
	});
}

$(document).on('ready page:load', initializeComments);