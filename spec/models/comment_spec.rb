require "rails_helper"

RSpec.describe Comment, :type => :model do

  it "should belong to user" do
    expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
  end

  it "orders comments chronologically" do
    post = Post.create!(tile: 'test title', body: "test body")
    comment1 = post.comments.create!(:body => "first comment")
    comment2 = post.comments.create!(:body => "second comment")
    expect(post.reload.comments).to eq([comment1, comment2])
  end
end
