require 'rails_helper'
require_relative '../../lib/bunny_adapter'

RSpec.describe BunnyAdapter, type: :lib do
  describe '#establish_connection_queue' do
    subject(:ocr_queue) { bunny_adapter.establish_connection_queue }
    let(:bunny_adapter) { BunnyAdapter.new(BunnyMock) }

    it 'creates the "ocr" queue' do
      expect(ocr_queue.name).to eq('ocr')
    end

    it 'reuses the existing "ocr" queue when called multiple times' do
      ocr_queue_cached = bunny_adapter.establish_connection_queue
      expect(ocr_queue).to eq(ocr_queue_cached)
    end
  end
end
