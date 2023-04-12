require 'http'
require 'tempfile'
require 'bunny'

class OcrWorker
  def start
    ocr_queue.subscribe(block: true) do |_delivery_info, _properties, file_url|
      process_image(file_url)
    end
  end

  private

  def process_image(file_url)
    # Download the image
    image_tempfile = Tempfile.new(['image', File.extname(file_url)])
    File.open(image_tempfile.path, 'wb') do |file|
      file.write(HTTP.get(file_url).to_s)
    end

    # Perform OCR processing
    result = perform_ocr(image_tempfile.path)

    # Log the result or an error
    if result
      puts "Text found: #{result}"
    else
      puts "Error: OCR processing failed."
    end

    # Clean up
    image_tempfile.close
    image_tempfile.unlink
  end

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



  def perform_ocr(image_path)
    # Use an OCR library to recognize text from the image.
    # You can use the Tesseract OCR library with the "tesseract" gem or another OCR library.
    # For this example, we will return dummy text as the recognized text.
    "Sample text from image"
  end

=begin
  def perform_ocr(image_path)
    # Use the Tesseract OCR library to recognize text from the image.
    ocr = RTesseract.new(image_path, lang: 'eng')
    ocr.to_s # returns the recognized text
  end
=end
end

OcrWorker.new.start
