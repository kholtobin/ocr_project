class BunnyAdapter
  require 'bunny'

  #RABBITMQ_CONNECTION = Bunny.new(host: 'rabbitmq', user: 'guest', pass: 'guest')
  #RABBITMQ_CONNECTION.start
  #RABBITMQ_CHANNEL = RABBITMQ_CONNECTION.create_channel
  #OCR_QUEUE = RABBITMQ_CHANNEL.queue('ocr')

  def rabbitmq_connection
    @rabbitmq_connection ||= begin
      connection = Bunny.new(host: 'rabbitmq', user: 'guest', pass: 'guest')
      connection.start
      connection
    end
  end

  def rabbitmq_channel
    @rabbitmq_channel ||= rabbitmq_connection.create_channel
  end

  def ocr_queue
    @ocr_queue ||= rabbitmq_channel.queue('ocr')
  end
end
