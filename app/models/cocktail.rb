class Cocktail < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  mount_uploader :photo, PhotoUploader

  def safe_photo
    if photo.present?
      photo
    else
      ""
    end
  end
end
