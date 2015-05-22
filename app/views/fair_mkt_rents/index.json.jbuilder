json.array!(@fair_mkt_rents) do |fair_mkt_rent|
  json.extract! fair_mkt_rent, :id, :fmr0, :fmr1, :fmr2, :fmr3, :fmr4, :metro_code, :year, :fmr_dataset_id
  json.url fair_mkt_rent_url(fair_mkt_rent, format: :json)
end
