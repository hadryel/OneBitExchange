get_exchange_ratio = ->
  start_waiting()
  $.ajax '/convert',
      type: 'GET'
      dataType: 'json'
      data: {
              source_currency: $("#source_currency").val(),
              target_currency: $("#target_currency").val()
            }
      error: (jqXHR, textStatus, errorThrown) ->
        alert textStatus
        stop_waiting()
      success: (data, text, jqXHR) ->
        $('#ratio').val(data.ratio)
        calculate()
        stop_waiting()
    return false;

calculate = ->
  $('#result').val($('#ratio').val()*$('#amount').val())

invert = ->
  current = $('#source_currency').val()
  $('#source_currency').val($('#target_currency').val())
  $('#target_currency').val(current)

start_waiting = ->
  $('#submit_button').addClass('hidden')
  $('#wait_button').removeClass('hidden')

stop_waiting = ->
  $('#wait_button').addClass('hidden')
  $('#submit_button').removeClass('hidden')


$(document).ready ->
  get_exchange_ratio()

  $('#source_currency,#target_currency').on 'change', ->
    get_exchange_ratio()

  $('#amount').on 'keyup', ->
    calculate()
  
  $('form').submit (e) ->
    e.preventDefault()
    invert()
    get_exchange_ratio()
    return false