class Timeslot < ApplicationRecord
  belongs_to :field
  has_many :matches
end
