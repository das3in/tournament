class Player < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :player_teams
  has_many :teams, through: :player_teams
end
