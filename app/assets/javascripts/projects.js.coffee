# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  #This is needed since if the project_properties_form is rendered before the project_properties we get an empty property.
  $("#project_properties_form").insertBefore('#properties');
  