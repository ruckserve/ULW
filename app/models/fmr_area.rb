class FmrArea < ActiveRecord::Base
  belongs_to :fmr_dataset

  validates :state, :area_name,
    :metro_code, :year, presence: true
  validates :metro_code,
    uniqueness: { scope: [:year, :fmr_dataset, :state] }

  def self.map_by_state(year = Time.now.year)
    initial = Hash.new {|h,k| h[k] = {'metro' => [], 'rural' => []}}
    where(year: Time.now.year).inject(initial) do |areas, area|
      metro = area.metro_area ? 'metro' : 'rural'
      areas[area.state][metro] << area
      areas
    end
  end
end
