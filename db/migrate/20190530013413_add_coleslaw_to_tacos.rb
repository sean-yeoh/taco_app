class AddColeslawToTacos < ActiveRecord::Migration[5.2]
  def change
    add_column :tacos, :coleslaw, :boolean, default: false
  end
end
