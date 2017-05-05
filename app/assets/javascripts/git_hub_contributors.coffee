# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('form#new_git_hub_contributor').submit ->
    username = $('input#git_hub_contributor_username').val()
    window.location.href = "/#{username}"
    false
  
  $('div.mb-5').addClass('px-3')