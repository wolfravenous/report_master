# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# jQuery ->
#   prop_sub_types = $('#property_prop_sub_type_id').html()
#   $('#property_prop_type_id').change ->
#     prop_type = $('#property_prop_type_id :selected').text()
#     escaped_prop_type = prop_type.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
#     options = $(prop_sub_types).filter("optgroup[label='#{escaped_prop_type}']").html()
#     if options
#       $('#property_prop_sub_type_id').html(options)
#     else
#       $('#property_prop_sub_type_id').empty()#


jQuery ->
  intros = $('#report_intro_id').html()
  $('#report_subject_id').change ->
    subject = $('#report_subject_id :selected').text()
    escaped_subject = subject.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(intros).filter("optgroup[label='#{escaped_subject}']").html()
    if options
      $('#report_intro_id').html(options)
    else
      $('#report_intro_id').empty()

  units = $('#report_unit_id').html()
  $('#report_subject_id').change ->
    subject = $('#report_subject_id :selected').text()
    escaped_subject = subject.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(units).filter("optgroup[label='#{escaped_subject}']").html()
    if options
      $('#report_unit_id').html(options)
    else
      $('#report_unit_id').empty()

  initials = $('#report_initial_id').html()
  $('#report_subject_id').change ->
    subject = $('#report_subject_id :selected').text()
    escaped_subject = subject.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(units).filter("optgroup[label='#{escaped_subject}']").html()
    if options
      $('#report_initial_id').html(options)
    else
      $('#report_initial_id').empty()

  endings = $('#report_ending_id').html()
  $('#report_subject_id').change ->
    subject = $('#report_subject_id :selected').text()
    escaped_subject = subject.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(units).filter("optgroup[label='#{escaped_subject}']").html()
    if options
      $('#report_ending_id').html(options)
    else
      $('#report_ending_id').empty()

  futures = $('#report_future_id').html()
  $('#report_subject_id').change ->
    subject = $('#report_subject_id :selected').text()
    escaped_subject = subject.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(futures).filter("optgroup[label='#{escaped_subject}']").html()
    if options
      $('#report_future_id').html(options)
    else
      $('#report_future_id').empty()
