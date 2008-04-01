require File.dirname(__FILE__) + '/../../spec_helper'

describe "/posts/new.html.erb" do
  include PostsHelper
  
  before(:each) do
    @post = mock_model(Post)
    @post.stub!(:new_record?).and_return(true)
    @post.stub!(:title).and_return("MyString")
    @post.stub!(:body).and_return("MyText")
    @post.stub!(:excerpt).and_return("MyText")
    @post.stub!(:is_published).and_return(false)
    assigns[:post] = @post
  end

  it "should render new form" do
    render "/posts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", posts_path) do
      with_tag("input#post_title[name=?]", "post[title]")
      with_tag("textarea#post_body[name=?]", "post[body]")
      with_tag("textarea#post_excerpt[name=?]", "post[excerpt]")
      with_tag("input#post_is_published[name=?]", "post[is_published]")
    end
  end
end


