# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.menu-open').click ->
    $('#mySidenav').css("width", '220px')
    return

  $('.closebtn').click ->
    $('#mySidenav').css("width", '0px')
    return

  $('#upload-launch').click ->
    $('#upload-errors').css("display", 'none')
    $('#upload-success').css("display", 'none')
    $('#import-errors').css("display", 'none')
    $('#import-finished').css("display", 'none')
    $('#fileupload').fileupload
      dataType: 'json'
      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $('#progress .bar-success').css 'width', progress + '%'
      done: (e, data) ->
        if data.result.errors
          $('#upload-errors').css("display", 'inherit')
          i = 0
          while i < data.result.errors.length
            $('#upload-errors').append("<span>" + data.result.errors[i] + "</span></br>");
            i++
        else
          $('#upload-success').css("display", 'inherit')
          $('#file-name').text(data.result.name)
          $('#progress').css("display", 'none')
          $('#import-process').css("display", 'inherit')
          setInterval (->
            $.ajax
              url: "/admin/import_users_poller/" + data.result.id,
              dataType: "json"
              success: (ajax_data, textStatus, jqXHR) ->
                if (ajax_data.status == "complete")
                  $('#import-process').css("display", 'none')
                  $('#import-success').css("display", 'inherit')
                  $('#import-finished').css("display", 'inherit')
                if (ajax_data.status == "failed")
                  $('#import-process').css("display", 'none')
                  $('#import-errors').css("display", 'inherit')
                  $('#import-finished').css("display", 'inherit')
          ), 5000
    $('#fileupload').click()
