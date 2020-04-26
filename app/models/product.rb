class Product < ApplicationRecord
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Csv.new(file.path, nil, :ignore)
    when '.xls' then Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(1)
    rows = []
    (2..spreadsheet.last_row).each do |i|
      rows << spreadsheet.row(i)
    end
    import!(header, rows, on_duplicate_key_update: [:name])
  end
end
