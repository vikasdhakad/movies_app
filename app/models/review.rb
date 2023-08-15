class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :stars, :content, presence: true
end
