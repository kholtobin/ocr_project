require 'spec_helper'
require_relative '../extract_text_service'

RSpec.describe ExtractTextService do
  let(:file_url) { 'https://tesseract.projectnaptha.com/img/eng_bw.png' }
  let(:file_text) do
    <<~TEXT.strip
     Text found: Mild Splendour of the various-vested Night!
     Mother of wildly-working visions! hail!
     I watch thy gliding, while with watery light
     Thy weak eye glimmers through a fleecy veil;
     And when thou lovest thy pale orb to shroud
     Behind the gather’d blackness lost on high;
     And when thou dartest from the wind-rent cloud
     Thy placid lightning o’er the awaken’d sky.
    TEXT
  end

  describe '#call' do
    subject{ ExtractTextService.new.(file_url) }

    it 'returns text from image' do
      is_expected.to eq([:ok, file_text])
    end
  end
end

