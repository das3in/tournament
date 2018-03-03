class Match < ApplicationRecord
  belongs_to :home_team, class_name: "Entry"
  belongs_to :away_team, class_name: "Entry"
  belongs_to :tournament
  belongs_to :timeslot
end
