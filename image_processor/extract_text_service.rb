class ExtractTextService
  def call(url)
    # Download the image
    image_tempfile = Tempfile.new(['image', File.extname(url)])
    File.open(image_tempfile.path, 'wb') do |file|
      file.write(HTTP.get(url).to_s)
    end

    # Perform OCR processing
    result = perform_ocr(image_tempfile.path)

    # Log the result or an error
    if result
      [:ok, "Text found: #{result}"]
    else
      [:error]
    end
  ensure
    # Clean up
    image_tempfile.close
    image_tempfile.unlink
  end

  private

  def perform_ocr(image_path)
    RTesseract.new(image_path).to_s.strip
  end
end
