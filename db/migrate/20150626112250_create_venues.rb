class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.text :address
      t.text :commune
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
