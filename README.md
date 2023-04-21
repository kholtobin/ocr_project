# OCR Image Processor
An OCR (Optical Character Recognition) Image Processor is a simple application that extracts text from images using RabbitMQ for asynchronous processing and the Tesseract OCR engine.
# Setup
Install Docker.
Clone repository:
```bash
git clone git@github.com:kholtobin/ocr_project.git
cd ocr_project
docker-compose build
docker-compose up
```

# Run tests for rails application part:
```bash
docker-compose exec web rspec
```

# Run test for image_processor:
```bash
docker-compose exec image_processor rspec
```
