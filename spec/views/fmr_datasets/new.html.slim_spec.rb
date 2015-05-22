require 'rails_helper'

RSpec.describe "fmr_datasets/new", type: :view do
  before(:each) do
    assign(:fmr_dataset, FmrDataset.new(
      :requested_by => "MyString",
      :data_year => "MyString",
      :method => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new fmr_dataset form" do
    render

    assert_select "form[action=?][method=?]", fmr_datasets_path, "post" do

      assert_select "input#fmr_dataset_requested_by[name=?]", "fmr_dataset[requested_by]"

      assert_select "input#fmr_dataset_data_year[name=?]", "fmr_dataset[data_year]"

      assert_select "input#fmr_dataset_method[name=?]", "fmr_dataset[method]"

      assert_select "input#fmr_dataset_description[name=?]", "fmr_dataset[description]"
    end
  end
end
