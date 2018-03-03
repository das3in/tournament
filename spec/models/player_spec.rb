require "rails_helper"

describe Player do
  context "validations" do
    it "should have valid valiations" do
      should validate_presence_of(:first_name)
      should validate_presence_of(:last_name)
    end
  end

  context "associations" do
    it "should have valid associations" do
      should have_many(:teams)
    end
  end
end
