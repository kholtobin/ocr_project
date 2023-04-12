class BunnyAdapter
  require 'bunny'

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
