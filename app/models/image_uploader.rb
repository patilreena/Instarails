class ImageUploader < Shrine
	include ImageUploader::Attachment.new(:image)
  # plugins and uploading logic
end