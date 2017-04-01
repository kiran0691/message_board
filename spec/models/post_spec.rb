require "rails_helper"

RSpec.describe Post, :type => :model do

  it "should have many comments" do
    expect(Post.reflect_on_association(:comments).macro).to eq :has_many
  end

  it "should have title and body" do
    expect(Post.new(tile: "New Test Title", body: nil )).to_not be_valid
  end


end
