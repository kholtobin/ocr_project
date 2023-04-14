require 'bunny'

class BunnyAdapter
  def initialize(conn_klass = Bunny)
    @conn_klass = conn_klass
  end

  def establish_connection_queue
    return @ocr_queue if @ocr_queue

    @rabbitmq_connection = @conn_klass.new(host: 'rabbitmq', user: 'guest', pass: 'guest')
    @rabbitmq_connection.start

    @ocr_queue = @rabbitmq_connection.create_channel.queue('ocr')
  end
end
