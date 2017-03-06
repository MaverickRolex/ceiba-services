# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.menu-open').click ->
    document.getElementById('mySidenav').style.width = '220px'
    return

  $('.closebtn').click ->
    document.getElementById('mySidenav').style.width = '0'
    return