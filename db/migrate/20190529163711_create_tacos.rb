class CreateTacos < ActiveRecord::Migration[5.2]
  def change
    create_table :tacos do |t|
      t.string :meat
      t.boolean :rice, default: false
      t.boolean :salsa, default: false
      t.text :notes

      t.timestamps
    end
  end
end
