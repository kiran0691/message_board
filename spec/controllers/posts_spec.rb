require "rails_helper"

RSpec.describe PostsController, :type => :controller do
  describe "GET #index" do
    it "should not redirect to index without signin" do
      get :index
      expect( response ).not_to render_template( :index )
    end
  end

  describe "anonymous user" do
    before :each do
      login_with nil
    end
  end

  describe "Get #new " do
    it "should be redirected to signin" do
      get :new
      expect( response ).to redirect_to( new_user_session_path )
    end


    it "should let redirect to new" do
      login_with ( :user )
      get :new
      expect( response ).to render_template( :new )
    end
  end
end
