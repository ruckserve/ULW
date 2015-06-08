class UlwController < ApplicationController

  def show
    @fmr = FairMktRent.by_metro_code(metro_code_params)

    monthly_rent = @fmr['fmr' + params['bedrooms']]
    yearly_rent = monthly_rent.to_i * 12

    weekly_working_hours = 40
    yearly_working_hours = 52 * weekly_working_hours

    rent_percentage_of_income = 30.00 / 100.00

    ulw = ( yearly_rent / rent_percentage_of_income ) / yearly_working_hours
    ulw = BigDecimal.new(ulw.to_s).round(2)
    display_string = 'The Universal Living Wage for this type of housing in your area is: '
    display_string += view_context.number_to_currency(ulw) + ' per hour'

    render plain: display_string
  end

  def search
    @fmr_areas = FmrArea.map_by_state
    response.headers.delete 'X-Frame-Options'
  end

private
  def metro_code_params
    params.permit(:metro_code).symbolize_keys
  end
end
