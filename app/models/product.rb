class Product < ApplicationRecord
  # attr_accessible :name, :price, :release_date

  def self.to_csv(options = {})
    CSV.genarate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Product.create! row.to_hash
    end
  end
end
