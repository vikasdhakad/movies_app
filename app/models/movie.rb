class Movie < ApplicationRecord
  has_many :reviews

  validates :name, :description, :year, :director, :actor, :filming_location, :country, presence: true

  scope :search_by_actor_name, -> (actor) { where(actor: actor)}
end
