require 'rails_helper'

RSpec.describe "fair_mkt_rents/edit", type: :view do
  before(:each) do
    @fair_mkt_rent = assign(:fair_mkt_rent, FairMktRent.create!(
      :fmr0 => "MyString",
      :fmr1 => "MyString",
      :fmr2 => "MyString",
      :fmr3 => "MyString",
      :fmr4 => "MyString",
      :metro_code => "MyString",
      :year => "MyString",
      :fmr_dataset => nil
    ))
  end

  it "renders the edit fair_mkt_rent form" do
    render

    assert_select "form[action=?][method=?]", fair_mkt_rent_path(@fair_mkt_rent), "post" do

      assert_select "input#fair_mkt_rent_fmr0[name=?]", "fair_mkt_rent[fmr0]"

      assert_select "input#fair_mkt_rent_fmr1[name=?]", "fair_mkt_rent[fmr1]"

      assert_select "input#fair_mkt_rent_fmr2[name=?]", "fair_mkt_rent[fmr2]"

      assert_select "input#fair_mkt_rent_fmr3[name=?]", "fair_mkt_rent[fmr3]"

      assert_select "input#fair_mkt_rent_fmr4[name=?]", "fair_mkt_rent[fmr4]"

      assert_select "input#fair_mkt_rent_metro_code[name=?]", "fair_mkt_rent[metro_code]"

      assert_select "input#fair_mkt_rent_year[name=?]", "fair_mkt_rent[year]"

      assert_select "input#fair_mkt_rent_fmr_dataset_id[name=?]", "fair_mkt_rent[fmr_dataset_id]"
    end
  end
end
