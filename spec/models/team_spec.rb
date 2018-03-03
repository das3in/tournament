require "rails_helper"

describe Team do
  context "validations" do
    it "should have valid validations" do
      should validate_presence_of(:name)
    end
  end

  context "associations" do
    it "should have valid associations" do
      should belong_to(:captain).class_name("User")
      should have_many(:users)
      should have_many(:entries)
      should have_many(:tournaments)
    end
  end
end
