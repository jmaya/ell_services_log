# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".datepicker").datepicker
    dateFormat: 'D, dd M yy'

  $('#select_all_tasks').click ->
    $('.task_checkboxes').prop("checked", true)
  $('#un_select_all_tasks').click ->
    $('.task_checkboxes').prop("checked", false)
  #Select and unselect for the Group Wizard
  $('#student-wizard-form :button').each ->
    input_id = this.id
    sanitized_input_id = input_id.replace(/-select|-unselect/, "")
    if this.id.match(/-select/)
      $(this).click ->
        $(".#{sanitized_input_id}").prop("checked",true)
    else
      $(this).click ->
        $(".#{sanitized_input_id}").prop("checked",false)
