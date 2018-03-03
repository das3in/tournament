require "rails_helper"

describe Timeslot do
  context "associations" do
    it "should have valid associations" do
      should belong_to(:field)
      should have_many(:matches)
    end
  end
end
