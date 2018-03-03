require "rails_helper"

describe Tournament do
  context "associations" do
    it "should have valid associations" do
      should belong_to(:division)
      should belong_to(:event)
      should have_many(:matches)
      should have_many(:entries)
    end
  end
end
