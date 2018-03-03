class Event < ApplicationRecord
  has_many :tournaments
  has_many :fields

  validates :name, presence: true
end
