class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true
  #validates :image, presence: true

  serialize :image, Array
  mount_uploaders :image, ImageUploader

  scope :get_by_title, ->(title) {
  where("title like ?", "%#{title}%")
  }
  scope :get_by_genre, ->(genre) {
  where("genre like ?", "%#{genre}%")
  }
end
