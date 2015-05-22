require 'rails_helper'

RSpec.describe "fmr_datasets/show", type: :view do
  before(:each) do
    @fmr_dataset = assign(:fmr_dataset, FmrDataset.create!(
      :requested_by => "Requested By",
      :data_year => "Data Year",
      :method => "Method",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Requested By/)
    expect(rendered).to match(/Data Year/)
    expect(rendered).to match(/Method/)
    expect(rendered).to match(/Description/)
  end
end
