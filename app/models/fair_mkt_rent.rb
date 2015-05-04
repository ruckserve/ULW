class FairMktRent < ActiveRecord::Base
  belongs_to :transaction

  validates :transaction, presence: true
  validates :fmr0, :fmr1, :fmr2, :fmr3, :fmr4,
    :metro_code, :year, presence: true
  validates :metro_code, uniqueness: { scope: :year }

  def by_metro_code(mcode, year = Time.now.year)
    find_by(metro_code: mcode, year: year)
  end
end
