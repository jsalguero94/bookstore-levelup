require 'rails_helper'

RSpec.describe "requests/show", type: :view do
  before(:each) do
    @request = assign(:request, Request.create!(
      name_of_book: "Name Of Book"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name Of Book/)
  end
end
