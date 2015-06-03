class CalculatesController < ApplicationController

  # GET /calculates/1
  # GET /calculates/1.json
  def show
    @fmr = FairMktRent.by_metro_code(metro_code_params(params))
  end

  # GET /calculates/new
  def new
    @fmr_areas = FmrArea.map_by_state
    response.headers.delete 'X-Frame-Options'
    render layout: false
  end

private
  def metro_code_params(params)
    params.require(:something).permit(:metro_code)
  end
end