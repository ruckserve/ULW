class FairMktRentsController < ApplicationController
  before_action :set_fair_mkt_rent, only: [:show, :edit, :update, :destroy]

  # GET /fair_mkt_rents
  # GET /fair_mkt_rents.json
  def index
    @fair_mkt_rents = FairMktRent.all
  end

  # GET /fair_mkt_rents/1
  # GET /fair_mkt_rents/1.json
  def show
  end

  # GET /fair_mkt_rents/new
  def new
    @fair_mkt_rent = FairMktRent.new
  end

  # GET /fair_mkt_rents/1/edit
  def edit
  end

  # POST /fair_mkt_rents
  # POST /fair_mkt_rents.json
  def create
    @fair_mkt_rent = FairMktRent.new(fair_mkt_rent_params)

    respond_to do |format|
      if @fair_mkt_rent.save
        format.html { redirect_to @fair_mkt_rent, notice: 'Fair mkt rent was successfully created.' }
        format.json { render :show, status: :created, location: @fair_mkt_rent }
      else
        format.html { render :new }
        format.json { render json: @fair_mkt_rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fair_mkt_rents/1
  # PATCH/PUT /fair_mkt_rents/1.json
  def update
    respond_to do |format|
      if @fair_mkt_rent.update(fair_mkt_rent_params)
        format.html { redirect_to @fair_mkt_rent, notice: 'Fair mkt rent was successfully updated.' }
        format.json { render :show, status: :ok, location: @fair_mkt_rent }
      else
        format.html { render :edit }
        format.json { render json: @fair_mkt_rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fair_mkt_rents/1
  # DELETE /fair_mkt_rents/1.json
  def destroy
    @fair_mkt_rent.destroy
    respond_to do |format|
      format.html { redirect_to fair_mkt_rents_url, notice: 'Fair mkt rent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fair_mkt_rent
      @fair_mkt_rent = FairMktRent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fair_mkt_rent_params
      params.require(:fair_mkt_rent).permit(:fmr0, :fmr1, :fmr2, :fmr3, :fmr4, :metro_code, :year, :fmr_dataset_id)
    end
end
