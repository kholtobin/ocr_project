require 'http'
require 'tempfile'
require 'bunny'
require 'rtesseract'
require './extract_text_service'

class OcrWorker
  def start
    ocr_queue.subscribe(block: true) do |_delivery_info, _properties, file_url|
      process_image(file_url)
    end
  end

  private

  def process_image(file_url)
    case ExtractTextService.new.call(file_url)
    in [:ok, text] then puts  "Text found: #{text}"
    in [:error, _] then puts "Error: OCR processing failed."
    end
  end

  def ocr_queue
    rabbitmq_connection = Bunny.new(host: 'rabbitmq', user: 'guest', pass: 'guest').tap(&:start)
    rabbitmq_channel = rabbitmq_connection.create_channel

    rabbitmq_channel.queue('ocr')
  end
end
