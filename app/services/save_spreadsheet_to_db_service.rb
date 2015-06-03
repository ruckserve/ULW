# app/services/save_spreadsheet_to_db_service.rb

class SaveSpreadsheetToDbService
  def initialize(xls_file, dataset, vars)
    @xls_file = xls_file
    @dataset = dataset
    @vars = vars
  end

  def perform
    @rows = Hash.new
    column_names = DatasetVar.attribute_names - %w(filename sheetname id fmr_dataset_id created_at updated_at)
    column_map = Hash[ column_names.collect { |name| [@vars[name], name] } ]
    column_headers = Hash.new


    Spreadsheet.open @xls_file do |book|
      book.worksheet(@vars.sheetname).each do |row_object|
        if column_headers.empty?
          header_row = row_object.to_a
          header_row.each_with_index do |name, index|
            column_headers[index] = column_map[name]
            column_names.delete(column_map[name])
          end

          unless column_names.empty?
            column_names.each { |var| @vars.add_spreadsheet_error(var) }
          end

          next
        end

        row = Hash.new
        row_object.to_a.each_with_index do |cell, index|
          if column_headers[index]
            cell = (cell.is_a? Float) ? cell.to_int : cell
            row[column_headers[index]] = cell
          end
        end

        @rows[row['metro_code']] ||= Hash.new
        @rows[row['metro_code']][row['state']] = row
      end
    end
  end

  def persist
    begin
      @rows.each do |metro_code, state_hash|
        fmr = FairMktRent.new(get_fmr_params_from(state_hash.values.first))
        fmr.fmr_dataset = @dataset
        fmr.year = @dataset.data_year

        state_hash.each do |state, attributes_hash|
          area = FmrArea.new(get_fmr_area_params_from(attributes_hash))

          area.fmr_dataset = @dataset
          area.year = @dataset.data_year

          area.save!
        end

        fmr.save!
      end

    rescue Exception => e
      @vars.add_spreadsheet_error(:filename, e.message)
    end
  end

private

  def get_fmr_params_from(all_params)
    @fmr_params ||= FairMktRent.attribute_names - %w(id created_at updated_at fmr_dataset_id)
    params = Hash[ @fmr_params.collect {|attr| [attr, all_params[attr]] } ]
  end

  def get_fmr_area_params_from(all_params)
    @fmr_area_params ||= FmrArea.attribute_names - %w(id created_at updated_at fmr_dataset_id)
    params = Hash[ @fmr_area_params.collect {|attr| [attr, all_params[attr]] } ]
  end
end
