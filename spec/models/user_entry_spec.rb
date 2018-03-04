require "rails_helper"

describe UserEntry do
  context "associations" do
    it "should have valid associations" do
      should belong_to(:user)
      should belong_to(:entry)
    end
  end
end
