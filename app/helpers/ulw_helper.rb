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

  def bedroom_opts
    (0..4).map do |n|
      name = n == 0 ? 'Studio/Efficiency' : n.to_s
      [ name, n ]
    end
  end
end
