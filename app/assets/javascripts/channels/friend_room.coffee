jQuery(document).on 'turbolinks:load', ->
  # viewの<div id="messages">から受け取る
  personal_messages = $('#personal_messages')

  # カスタムデータ属性(data-room_id)からルームの情報受け取る
  App.friend_room = App.cable.subscriptions.create { channel: "FriendRoomChannel", room_id: personal_messages.data('room_id') },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      $personal_messages = $('#personal_messages')
      $personal_messages.append data['personal_message']
      $personal_messages.scrollTop $personal_messages.prop('scrollHeight')

    speak: (personal_message) ->
      @perform 'speak', personal_message: personal_message
