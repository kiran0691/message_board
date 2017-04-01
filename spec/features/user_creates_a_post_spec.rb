feature "User creates new post", :type => :feature do
  it "should require the user log in before adding a post" do

    posts = Post.count
    password = "123456789"
    u = create( :user, password: password, password_confirmation: password )

    visit user_session_path

    within "#new_user" do
      fill_in "user_email", with: u.email
      fill_in "user_password", with: password
    end

    click_button "Log in"

    visit new_post_path

    within "#new-post" do
      fill_in "post_tile", with: "Post title"
      fill_in "post_body", with: "foobar foobar foobar"
    end

    click_link_or_button "Submit"

    expect( Post.count ).to eq(posts+1)
    expect( Post.first.tile).to eq( "Post title")

  end
end
