require "rails_helper"

describe UserTeam do
  context "associations" do
    it "should have valid associations" do
      should belong_to(:team)
      should belong_to(:user)
    end
  end
end
