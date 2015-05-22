json.array!(@fmr_datasets) do |fmr_dataset|
  json.extract! fmr_dataset, :id, :requested_by, :data_year, :method, :description
  json.url fmr_dataset_url(fmr_dataset, format: :json)
end
