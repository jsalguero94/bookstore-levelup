require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      message: "MyText",
      approved: false
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "textarea[name=?]", "comment[message]"

      assert_select "input[name=?]", "comment[approved]"
    end
  end
end
