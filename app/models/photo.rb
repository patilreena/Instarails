class Photo < ApplicationRecord
  include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
  belongs_to :user
   acts_as_votable

   has_many :comments
   
  def self.search(search)
   where(["caption LIKE ?", "%#{search}%"]) 
  end
end
