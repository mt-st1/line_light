# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $personal_messages = $('#personal_messages')
  $personal_messages.scrollTop $personal_messages.prop('scrollHeight')
  $('#personal_message_input').focus()

# リターンキーが押されたときFriendRoomチャンネルのspeakアクション実行
$(document).on 'keypress', '#personal_message_input', (event) ->
  if event.keyCode == 13 and event.target.value
    App.friend_room.speak(event.target.value)
    event.target.value = ''
    event.preventDefault()
