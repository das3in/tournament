require "rails_helper"

describe Match do
  context "associations" do
    it "should have valid associations" do
      should belong_to(:home_team).class_name("Entry")
      should belong_to(:away_team).class_name("Entry")
      should belong_to(:tournament)
      should belong_to(:timeslot)
    end
  end
end
