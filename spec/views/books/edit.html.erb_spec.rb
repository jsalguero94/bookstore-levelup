require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      code: "",
      name: "MyString",
      description: "MyText",
      price: "",
      number_of_pages: 1,
      active: false
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[code]"

      assert_select "input[name=?]", "book[name]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[price]"

      assert_select "input[name=?]", "book[number_of_pages]"

      assert_select "input[name=?]", "book[active]"
    end
  end
end
