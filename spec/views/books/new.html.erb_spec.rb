require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      code: "",
      name: "MyString",
      description: "MyText",
      price: "",
      number_of_pages: 1,
      active: false
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[code]"

      assert_select "input[name=?]", "book[name]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[price]"

      assert_select "input[name=?]", "book[number_of_pages]"

      assert_select "input[name=?]", "book[active]"
    end
  end
end
