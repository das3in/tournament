require "rails_helper"

describe PlayerTeam do
  context "associations" do
    it "should have valid associations" do
      should belong_to(:team)
      should belong_to(:player)
    end
  end
end
