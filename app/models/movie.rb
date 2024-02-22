class Movie < ApplicationRecord
  validates :title, :overview, uniqueness: true
  validates :title, :overview, presence: true
  has_many :bookmarks
  has_many :lists, through: :bookmarks
end
