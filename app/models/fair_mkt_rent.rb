class FairMktRent < ActiveRecord::Base
  belongs_to :fmr_dataset

  validates :fmr_dataset, presence: true
  validates :fmr0, :fmr1, :fmr2, :fmr3, :fmr4,
    :metro_code, :year, presence: true
  validates :metro_code,
    uniqueness: { scope: [:year, :fmr_dataset] }

  def by_metro_code(mcode, year = Time.now.year)
    find_by(metro_code: mcode, year: year)
  end
end
