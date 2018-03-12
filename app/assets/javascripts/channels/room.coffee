# クライアントサイドの処理を受け持つチャンネル
App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  # サーバから受け取ったHTMLを<div id="messages">内の最後に追加
  received: (data) ->
    $messages = $('#messages')
    $messages.append data['message']
    $messages.scrollTop $messages.prop('scrollHeight')

  speak: (message) ->
    # クライアントからイベント投げる
    # perform(action, data)により、room_channel.rbのspeakアクション呼ぶ
    @perform 'speak', message: message
