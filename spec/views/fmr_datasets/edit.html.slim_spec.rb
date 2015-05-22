require 'rails_helper'

RSpec.describe "fmr_datasets/edit", type: :view do
  before(:each) do
    @fmr_dataset = assign(:fmr_dataset, FmrDataset.create!(
      :requested_by => "MyString",
      :data_year => "MyString",
      :method => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit fmr_dataset form" do
    render

    assert_select "form[action=?][method=?]", fmr_dataset_path(@fmr_dataset), "post" do

      assert_select "input#fmr_dataset_requested_by[name=?]", "fmr_dataset[requested_by]"

      assert_select "input#fmr_dataset_data_year[name=?]", "fmr_dataset[data_year]"

      assert_select "input#fmr_dataset_method[name=?]", "fmr_dataset[method]"

      assert_select "input#fmr_dataset_description[name=?]", "fmr_dataset[description]"
    end
  end
end
