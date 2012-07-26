function url_replace(tag,url,sep) {
  url = url.replace(sep,$(tag).val());
  document.location.href = url;
};

jQuery(document).ready(function($) {
	
});
