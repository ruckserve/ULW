require 'rails_helper'

RSpec.describe "calculates/show", type: :view do
  before(:each) do
    @calculate = assign(:calculate, Calculate.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
