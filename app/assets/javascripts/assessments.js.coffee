# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#assessment_name').autocomplete
    source: '/assessments'
    delay: 500
    minLenght: 1
