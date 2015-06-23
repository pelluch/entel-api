class RemoveNullRestrictionOnInternetPriceInPlans < ActiveRecord::Migration
  def change
  	change_column :plans, :internet_price, :integer, null: true
  end
end
