class AddRegionToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :region, :text
  end
end
