require 'rails_helper'

RSpec.describe "fair_mkt_rents/index", type: :view do
  before(:each) do
    assign(:fair_mkt_rents, [
      FairMktRent.create!(
        :fmr0 => "Fmr0",
        :fmr1 => "Fmr1",
        :fmr2 => "Fmr2",
        :fmr3 => "Fmr3",
        :fmr4 => "Fmr4",
        :metro_code => "Metro Code",
        :year => "Year",
        :fmr_dataset => nil
      ),
      FairMktRent.create!(
        :fmr0 => "Fmr0",
        :fmr1 => "Fmr1",
        :fmr2 => "Fmr2",
        :fmr3 => "Fmr3",
        :fmr4 => "Fmr4",
        :metro_code => "Metro Code",
        :year => "Year",
        :fmr_dataset => nil
      )
    ])
  end

  it "renders a list of fair_mkt_rents" do
    render
    assert_select "tr>td", :text => "Fmr0".to_s, :count => 2
    assert_select "tr>td", :text => "Fmr1".to_s, :count => 2
    assert_select "tr>td", :text => "Fmr2".to_s, :count => 2
    assert_select "tr>td", :text => "Fmr3".to_s, :count => 2
    assert_select "tr>td", :text => "Fmr4".to_s, :count => 2
    assert_select "tr>td", :text => "Metro Code".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
