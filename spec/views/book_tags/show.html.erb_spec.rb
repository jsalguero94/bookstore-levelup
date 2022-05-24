require 'rails_helper'

RSpec.describe "book_tags/show", type: :view do
  before(:each) do
    @book_tag = assign(:book_tag, BookTag.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
