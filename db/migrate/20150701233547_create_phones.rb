class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :phone_manufacturer_id, null: false
      t.integer :year, null: false
      t.string :battery_life, null: false
      t.text :description
    end
  end
end
