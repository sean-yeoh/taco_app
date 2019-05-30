class AddPriceCentsToTacos < ActiveRecord::Migration[5.2]
  def change
    add_column :tacos, :price_cents, :integer, default: 0
  end
end
