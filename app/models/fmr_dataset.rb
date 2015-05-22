class FmrDataset < ActiveRecord::Base
  has_many :fmr_areas, dependent: :destroy
  has_many :fair_mkt_rents, dependent: :destroy
  has_one  :dataset_var, dependent: :destroy
  accepts_nested_attributes_for :dataset_var

  validates :requested_by, :data_year, :method,
    :description, presence: true
end
