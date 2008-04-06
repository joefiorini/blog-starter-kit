require File.dirname(__FILE__) + '/../../spec_helper'

describe "/posts/index.html.haml" do
  include PostsHelper
  
  before(:each) do
    post_98 = mock_model(Post)
    post_98.should_receive(:title).and_return("First Post")
    post_98.should_receive(:body).and_return("This is the first post.  Ain't it cool?")
    post_98.should_receive(:created_at).and_return(DateTime.new(2008, 4, 5))
    post_99 = mock_model(Post)
    post_99.should_receive(:title).and_return("Second Post")
    post_99.should_receive(:body).and_return("This is the second post.  Ain't it neat?")
    post_99.should_receive(:created_at).and_return(DateTime.new(2008, 4, 3))

    assigns[:posts] = [post_98, post_99]
  end

  it "should render list of posts" do
    render "/posts/index"
    response.should have_tag("div#posts")
    response.should have_tag("h2", "First Post")
    response.should have_tag("div.post-content", /This is the first post.  Ain't it cool?[.]*/m)
    response.should have_tag("h2", "Second Post")
    response.should have_tag("div.post-content", /This is the second post.  Ain't it neat?[.]*/m)
    response.should have_tag("h3#tags", /[.]*/, 2)
  end
  
end

