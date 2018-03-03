class Tournament < ApplicationRecord
  belongs_to :division
  belongs_to :event
  has_many :matches
  has_many :entries
end
