require 'rails_helper'

RSpec.describe "fmr_datasets/index", type: :view do
  before(:each) do
    assign(:fmr_datasets, [
      FmrDataset.create!(
        :requested_by => "Requested By",
        :data_year => "Data Year",
        :method => "Method",
        :description => "Description"
      ),
      FmrDataset.create!(
        :requested_by => "Requested By",
        :data_year => "Data Year",
        :method => "Method",
        :description => "Description"
      )
    ])
  end

  it "renders a list of fmr_datasets" do
    render
    assert_select "tr>td", :text => "Requested By".to_s, :count => 2
    assert_select "tr>td", :text => "Data Year".to_s, :count => 2
    assert_select "tr>td", :text => "Method".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
