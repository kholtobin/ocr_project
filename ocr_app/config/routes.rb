Rails.application.routes.draw do
  post 'ocr/process_image', to: 'ocr#process_image'
end
