function url_replace(tag,url,sep) {
  url = url.replace(sep,$(tag).val());
  document.location.href = url;
};

function re_render(data,textStatus,xhr) {
	console.log($(data).parent().attr('id'));
	console.log(data);
	console.log(textStatus);
	console.log(xhr);
};

jQuery(document).ready(function($) {
	$('.best_in_place').best_in_place();
	$('.best_in_place').bind("ajax:success", function (data,textStatus,xhr) {re_render(data,textStatus,xhr);});
});
