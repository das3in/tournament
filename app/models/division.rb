class Division < ApplicationRecord
  has_many :tournaments

  validates :name, presence: true
end
