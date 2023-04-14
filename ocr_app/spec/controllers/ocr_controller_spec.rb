require 'rails_helper'

RSpec.describe OcrController, type: :controller do
  describe 'POST #process_image' do
    context 'with a valid file URL' do
      let(:file_url) { 'https://tesseract.projectnaptha.com/img/eng_bw.png' }

      it 'responds with success' do
        post :process_image, params: { fileUrl: file_url }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with an invalid file URL' do
      let(:invalid_file_url) { 'https://invalid.url/invalid_image.png' }

      it 'responds with an error' do
        post :process_image, params: { fileUrl: invalid_file_url }
        expect(response).to have_http_status(:success)
      end
    end
  end
end

