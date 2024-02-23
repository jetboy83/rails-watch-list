class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :movies, through: :bookmarks
  has_one_attached :photo
end
