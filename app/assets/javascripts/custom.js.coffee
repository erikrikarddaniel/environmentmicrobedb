jQuery ->
  $('.best_in_place').best_in_place()
$(document).ready ->
  #This is needed since if the project_properties_form is rendered before the project_properties we get an empty property.
  $("#project_properties").prepend($('#properties'));