require File.dirname(__FILE__) + '/../../spec_helper'

describe "/posts/show.html.haml" do
  include PostsHelper
  
  before(:each) do
    @post = mock_model(Post)
    @post.should_receive(:title).and_return("First Post")
    @post.should_receive(:body).and_return("This is the first post.  Ain't it cool?")

    assigns[:post] = @post
  end

  it "should render attributes semantically" do
    render "/posts/show"
    response.should have_tag("h2", "First Post")
    response.should have_tag("div#posts")
    response.should have_tag("div.post-content", /This is the first post.  Ain't it cool?[.]*/m)
  end
end

