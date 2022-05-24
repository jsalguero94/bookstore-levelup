require 'rails_helper'

RSpec.describe "book_tags/index", type: :view do
  before(:each) do
    assign(:book_tags, [
      BookTag.create!(),
      BookTag.create!()
    ])
  end

  it "renders a list of book_tags" do
    render
  end
end
