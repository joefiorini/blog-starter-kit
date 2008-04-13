require File.dirname(__FILE__) + '/../../spec_helper'

describe "/posts/show.html.haml" do
  include PostsHelper
  
  before(:each) do
    @post = mock_model(Post)
    @post.should_receive(:title).and_return("First Post")
    @post.should_receive(:body).and_return("This is the first post.  Ain't it cool?")
    @post.should_receive(:created_at).and_return(DateTime.new(2008,4,3))
    assigns[:post] = @post
  end

  it "should render post attributes semantically" do
    render "/posts/show"
    response.should have_tag("h2", "First Post")
    response.should have_tag("div.post-content", /This is the first post.  Ain't it cool?[.]*/m)
  end
  
  it "should render add comment form" do
      render "/posts/show"
      response.should have_tag("form#comment-submission") do 
        response.should have_tag("label", "Name:")
        response.should have_tag("input#comment_name")
        response.should have_tag("input#comment_email")
        response.should have_tag("input#comment_url")
        response.should have_tag("textarea#comment_comment")
    end
  end
end
