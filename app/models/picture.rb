class Picture < ApplicationRecord
  validates :image, presence: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  mount_uploader :image, ImageUploader
  # def user
  #   return User.find_by(id: self.user_id)
  # end
end
