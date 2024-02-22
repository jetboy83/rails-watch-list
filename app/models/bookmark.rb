class Bookmark < ApplicationRecord
  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: 'should happen once per list' }
  belongs_to :movie
  belongs_to :list
end
