# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('form#new_git_hub_contributor').submit ->
    username = $('input#git_hub_contributor_username').val()
    if(username)
      window.location.href = "/#{username}"
    else
      alert('Please enter a valid username')  
    false
  
  $('div.mb-5').addClass('px-3')