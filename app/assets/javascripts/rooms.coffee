# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $messages = $('#messages')
  $messages.scrollTop $messages.prop('scrollHeight')
  $('#message_input').focus()

# message_inputというidをもった要素に対し
# リターンキーが押されたときRoomチャンネルのspeakアクション実行
$(document).on 'keypress', '#message_input', (event) ->
  if event.keyCode == 13 and event.target.value
    App.room.speak(event.target.value)
    event.target.value = ''
    event.preventDefault()
