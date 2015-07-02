class CreatePhoneManufacturers < ActiveRecord::Migration
  def change
    create_table :phone_manufacturers do |t|
      t.string :name, null: false
      t.string :country, null: false
    end
  end
end
