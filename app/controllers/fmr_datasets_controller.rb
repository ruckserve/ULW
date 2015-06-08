class FmrDatasetsController < ApplicationController
  before_action :set_fmr_dataset, only: [:show, :edit, :update, :destroy]

  # GET /fmr_datasets
  # GET /fmr_datasets.json
  def index
    @fmr_datasets = FmrDataset.all
  end

  # GET /fmr_datasets/1
  # GET /fmr_datasets/1.json
  def show
  end

  # GET /fmr_datasets/new
  def new
    @fmr_dataset = FmrDataset.new
    @fmr_dataset.dataset_var = DatasetVar.last || DatasetVar.new
  end

  # POST /fmr_datasets
  # POST /fmr_datasets.json
  def create
    @fmr_dataset = FmrDataset.new(fmr_dataset_params)
    @fmr_dataset.method = 'web upload'
    @fmr_dataset.dataset_var = DatasetVar.new(dataset_var_params)

    directory = 'lib/assets/fmr_dataset_spreadsheets'
    name = filename_params['filename']
    if name.present?
      path = Rails.root + directory + name.original_filename
      tempfile = File.open(name.tempfile)
      new_file = File.new(path, 'wb')

      IO.copy_stream(tempfile, new_file)
      tempfile.close
      new_file.close

      service = SaveSpreadsheetToDbService.new(path, @fmr_dataset, @fmr_dataset.dataset_var)
      service.perform
    end

    @fmr_dataset.dataset_var.filename = path

    begin
      @fmr_dataset.transaction do
        service.persist if service
        @fmr_dataset.dataset_var.save!
        @fmr_dataset.save!
      end
    rescue
      not_persisted = true
    end

    respond_to do |format|
      unless not_persisted
        format.html { redirect_to @fmr_dataset, notice: 'Fmr dataset was successfully created.' }
        format.json { render :show, status: :created, location: @fmr_dataset }
      else
        format.html { render :new }
        format.json { render json: @fmr_dataset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fmr_datasets/1
  # DELETE /fmr_datasets/1.json
  def destroy
    @fmr_dataset.destroy
    respond_to do |format|
      format.html { redirect_to fmr_datasets_url, notice: 'Fmr dataset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_fmr_dataset
    @fmr_dataset = FmrDataset.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fmr_dataset_params
    params.require(:fmr_dataset).permit(:requested_by, :data_year, :method, :description)
  end

  def dataset_var_params
    params.require(:fmr_dataset).require(:dataset_var_attributes).
      permit(:sheetname, :fmr0, :fmr1, :fmr2, :fmr3, :fmr4, :metro_code, :metro_area, :area_name, :state)
  end

  def filename_params
    filename = params.require(:fmr_dataset).require(:dataset_var_attributes).permit(:filename)
  end
end
