class ChangePriceToPricePerDay < ActiveRecord::Migration[7.0]
  def change
    rename_column :bicycles, :price, :price_per_day
  end
end
