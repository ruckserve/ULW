module UlwHelper
  def state_opts(states)
    options_for_select(states.sort)
  end

  def area_opts(area)
    area.sort_by! { |a| a.area_name }
    options_from_collection_for_select(area, :metro_code, :area_name)
  end

  def state_attrs
    { prompt: 'Select state', class: 'form-control' }
  end

  def area_attrs
    { class: 'form-control' }
  end
end
