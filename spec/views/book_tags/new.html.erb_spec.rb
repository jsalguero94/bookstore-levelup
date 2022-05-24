require 'rails_helper'

RSpec.describe "book_tags/new", type: :view do
  before(:each) do
    assign(:book_tag, BookTag.new())
  end

  it "renders new book_tag form" do
    render

    assert_select "form[action=?][method=?]", book_tags_path, "post" do
    end
  end
end
