class ServerAuth
  def incoming(message, request, callback)
    # # Let non-subscribe messages through
    # unless message['channel'] == '/meta/subscribe'
    #   return callback.call(message)
    # end
    #
    # # Get subscribed channel and auth token
    # subscription = message['subscription']
    # msg_token    = message['ext'] && message['ext']['authToken']
    #
    # # Find the right token for the channel
    # @file_content ||= File.read('./tokens.json')
    #
    # registry = JSON.parse(@file_content)
    # token    = registry[subscription]
    #
    # # Add an error if the tokens don't match
    # if token != msg_token
    #   message['error'] = 'Invalid subscription auth token'
    # end
    #
    # # Call the server back now we're done
    # if is_meta_message?(message)
    #   puts 'received meta message'
    # elsif is_handshake_message(message)
    #   puts 'handshaked with id ' + message['id']
    # elsif is_subcription_message(message)
    #   puts 'channel subscribed'
    # elsif is_disconnected(message)
    #   puts 'disconnected with client ' + message['id']
    # else
    #   puts message
    # end
    puts message


    callback.call(message)
  end

  def is_meta_message?(message)
    return message['channel']  == "/meta/connect"
  end

  def is_subcription_message(message)
    return message['channel']  == "/meta/subscribe"
  end

  def is_handshake_message(message)
    return message['channel']  == "/meta/handshake"
  end

  def is_disconnected(message)
    return message['channel']  == "/meta/disconnect"
  end

end