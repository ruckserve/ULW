class DatasetVar < ActiveRecord::Base
  belongs_to :fmr_dataset

  validates :filename, :sheetname, :fmr0, :fmr1, :fmr2, :fmr3, :fmr4,
    :metro_code, :area_name, :state, :metro_area, presence: true

  validate :check_spreadsheet_errors

  def add_spreadsheet_error(attribute, error_msg=nil)
    error_msg ||= "Spreadsheet error: Column not found for #{attribute}"
    self.spreadsheet_errors[attribute] = error_msg
  end

  def spreadsheet_errors
    @spreadsheet_error ||= Hash.new
  end

  def check_spreadsheet_errors
    self.spreadsheet_errors.each do |attribute, error_msg|
      errors.add(attribute.to_sym, error_msg)
    end
  end
end
