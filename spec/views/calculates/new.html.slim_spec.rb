require 'rails_helper'

RSpec.describe "calculates/new", type: :view do
  before(:each) do
    assign(:calculate, Calculate.new())
  end

  it "renders new calculate form" do
    render

    assert_select "form[action=?][method=?]", calculates_path, "post" do
    end
  end
end
