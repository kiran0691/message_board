require 'rails_helper'

  RSpec.describe "routes to the posts controller", type: :routing do
  it "routes a named route" do
    expect(get: new_post_path).
      to route_to(controller: "posts", action: "new")
  end
end
