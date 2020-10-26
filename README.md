Task:
Create a Rails app that will:
1) Allow a user to upload a png image
2) Use tesseract to extract and store the hOCR data for that image (can use the gem, can be done inline, bonus for async ala Resque)
3) Mark up the image with bounding boxes around the words found from the hOCR data , should use imagemagick (gem or roll your own)
4) Store the new image (and old image) and allow it to be downloaded
5) Allow the user to search for possible words on the image via a text input (strech goal)
6) Use Service Object when appropriate

Expections:
* Use Rails 4.2, or 5+
* Use RSPEC for testing
* User interface not a top priority
* No user login needed, etc, just a bare bones type app

Gems to use:
* https://github.com/dannnylo/rtesseract (simple wrapper around tesseract)
* https://github.com/thoughtbot/paperclip or ActiveStorage (for file persistence)
* https://github.com/rmagick/rmagick (for image manipulation)

Other links:
* Example image: https://www.dropbox.com/s/s95tlxl24zlni2w/example_remit.png?dl=0
* Dade GUI example: https://www.dropbox.com/s/2zhl6skrbkqua0z/dade_screen.png?dl=0
* https://github.com/tesseract-ocr/tesseract
* https://hackernoon.com/the-3-tenets-of-service-objects-c936b891b3c2