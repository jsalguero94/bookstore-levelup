require 'rails_helper'

RSpec.describe "requests/index", type: :view do
  before(:each) do
    assign(:requests, [
      Request.create!(
        name_of_book: "Name Of Book"
      ),
      Request.create!(
        name_of_book: "Name Of Book"
      )
    ])
  end

  it "renders a list of requests" do
    render
    assert_select "tr>td", text: "Name Of Book".to_s, count: 2
  end
end
