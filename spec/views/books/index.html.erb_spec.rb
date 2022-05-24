require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        code: "",
        name: "Name",
        description: "MyText",
        price: "",
        number_of_pages: 2,
        active: false
      ),
      Book.create!(
        code: "",
        name: "Name",
        description: "MyText",
        price: "",
        number_of_pages: 2,
        active: false
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
