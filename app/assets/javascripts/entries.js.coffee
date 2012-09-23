# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".datepicker").datepicker
    dateFormat: 'D, dd M yy'

  $('#select_all_tasks').click ->
    $(':checkbox').prop("checked", true)
  $('#un_select_all_tasks').click ->
    $(':checkbox').prop("checked", false)

