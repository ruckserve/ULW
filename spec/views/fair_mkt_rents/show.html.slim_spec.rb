require 'rails_helper'

RSpec.describe "fair_mkt_rents/show", type: :view do
  before(:each) do
    @fair_mkt_rent = assign(:fair_mkt_rent, FairMktRent.create!(
      :fmr0 => "Fmr0",
      :fmr1 => "Fmr1",
      :fmr2 => "Fmr2",
      :fmr3 => "Fmr3",
      :fmr4 => "Fmr4",
      :metro_code => "Metro Code",
      :year => "Year",
      :fmr_dataset => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fmr0/)
    expect(rendered).to match(/Fmr1/)
    expect(rendered).to match(/Fmr2/)
    expect(rendered).to match(/Fmr3/)
    expect(rendered).to match(/Fmr4/)
    expect(rendered).to match(/Metro Code/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(//)
  end
end
