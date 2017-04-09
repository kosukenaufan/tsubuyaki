class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
