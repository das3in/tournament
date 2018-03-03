require "rails_helper"

describe Field do
  context "validations" do
    it "should have valid validations" do
      should validate_presence_of(:name)
    end
  end

  context "associations" do
    it "should have valid associations" do
      should belong_to(:event)
    end
  end
end
