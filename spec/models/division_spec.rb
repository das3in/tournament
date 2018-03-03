require "rails_helper"

describe Division do
  context "validations" do
    it "should have valid validations" do
      should validate_presence_of(:name)
    end
  end

  context "associations" do
    it "should have valid associations" do
      should have_many(:tournaments)
    end
  end
end
