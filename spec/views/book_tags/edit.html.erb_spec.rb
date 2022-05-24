require 'rails_helper'

RSpec.describe "book_tags/edit", type: :view do
  before(:each) do
    @book_tag = assign(:book_tag, BookTag.create!())
  end

  it "renders the edit book_tag form" do
    render

    assert_select "form[action=?][method=?]", book_tag_path(@book_tag), "post" do
    end
  end
end
