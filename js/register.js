// JavaScript Document
$(document).ready(function(){
	$(".image-picker").imagepicker();
    var container = jQuery("select.image-picker.grid").next("ul.thumbnails");
	container.imagesLoaded( function() {
  		// images have loaded
        container.masonry({
        itemSelector:   "li",
		columnWidth: 50
    	});
	});
});