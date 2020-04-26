class ChangePriceToBeFloatInProducts < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :price, :float
  end

  def down
    change_column :products, :price, :integer
  end
end
