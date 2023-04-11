class OcrController < ApplicationController
  def process_image
    BunnyAdapter.new.ocr_queue.publish(params[:fileUrl])
    render json: { message: 'Image URL added to the OCR queue.' }
  end
end
