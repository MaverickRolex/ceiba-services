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
    $('#fileupload').fileupload
      dataType: 'json'
      $('#import-process').css("display", 'inherit')
      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $('#progress .bar-success').css 'width', progress + '%'
      done: (e, data) ->
        $('#import-process').css("display", 'none')
        if data.result.errors
          $('#import-errors').css("display", 'inherit')
          i = 0
          while i < data.result.errors.length
            $('#import-errors').append("<span>" + data.result.errors[i] + "</span>");
            i++
        else
          $('#import-errors').css("display", 'none')
          $('#import-success').css("display", 'inherit')
          $('#file-name').text(data.result.name)
          $('#import-btn').css("display", 'inherit')

          setInterval (->
            $.ajax("/admin/import_users_poller/" + data.result.id)
            return
          ), 5000
    $('#fileupload').click()
