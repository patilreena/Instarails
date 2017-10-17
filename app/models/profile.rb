class Profile < ApplicationRecord
	include AvatarUploader::Attachment.new(:avatar)
  belongs_to :user
end
