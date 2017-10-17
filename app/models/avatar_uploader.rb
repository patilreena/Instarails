class AvatarUploader < Shrine
	include AvatarUploader::Attachment.new(:avatar)
  # plugins and uploading logic
end