class Team < ApplicationRecord
  belongs_to :captain, class_name: "User"
  has_many :user_teams
  has_many :users, through: :user_teams

  has_many :entries
  has_many :tournaments, through: :entries

  validates :name, presence: true

  scope :captain_teams, -> (user) { where(captain: user)}
end
