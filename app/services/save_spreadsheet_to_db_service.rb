# app/services/save_spreadsheet_to_db_service.rb

class SaveSpreadsheetToDbService
  def initialize(xls_file, dataset, vars)
    @xls_file = xls_file
    @dataset = dataset
    @vars = vars
  end

  def perform
    @rows = Array.new
    column_names = DatasetVar.attribute_names - %w(filename sheetname id fmr_dataset_id created_at updated_at)
    column_map = Hash[ column_names.collect { |name| [@vars[name], name] } ]
    column_headers = Hash.new

    # TODO remove
    pass = 0

    Spreadsheet.open @xls_file do |book|
      book.worksheet(@vars.sheetname).each do |row_object|
        pass += 1

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
          row[column_headers[index]] = cell if column_headers[index]
        end

        @rows << row
      end
    end
  end

  def write
    @rows.each do |attributes|
      FairMktRent.attribute_names
      FairMktRent.create(attributes)
      FmrAreas.create(attributes)
    end
  end
end
