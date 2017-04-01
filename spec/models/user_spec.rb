require "rails_helper"

RSpec.describe User, :type => :model do

  it "should have email" do
    expect(User.new(email: nil)).to_not be_valid
  end
end
