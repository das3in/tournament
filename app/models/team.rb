class Team < ApplicationRecord
  belongs_to :captain, class_name: "Player"
  has_many :player_teams
  has_many :players, through: :player_teams

  has_many :entries
  has_many :tournaments, through: :entries

  validates :name, presence: true
end
