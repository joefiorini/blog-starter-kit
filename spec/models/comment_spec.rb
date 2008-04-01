require File.dirname(__FILE__) + '/../spec_helper'

describe Comment do
  it "should belong to a post" do
    Comment.should_receive(:belongs_to).with(:post)
    load 'comment.rb'
  end
end

describe Comment do
  before(:each) do
    @comment = Comment.new
  end

  it "should be valid" do
    @comment.should be_valid
  end
end
