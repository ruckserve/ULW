class Transaction < ActiveRecord::Base
  has_many :fmr_areas, dependent: :destroy
  has_many :fair_mkt_rents, dependent: :destroy

  validates :requested_by, :data_year, :method,
    :filename, :description, presence: true

  before_destroy :remove_file

  alias_method :destroy, :rollback

  def remove_file
    file = self.filename
    puts file
    # TODO: remove file
  end
end
