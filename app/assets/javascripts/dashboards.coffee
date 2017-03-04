# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

openNav = ->
  document.getElementById('mySidenav').style.width = '220px'
  return

closeNav = ->
  document.getElementById('mySidenav').style.width = '0'
  return

$ ->
  $('.menu-open').click ->
    openNav()
    return

  $('.closebtn').click ->
    closeNav() 
    return