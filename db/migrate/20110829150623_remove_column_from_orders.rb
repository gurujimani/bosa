class RemoveColumnFromOrders < ActiveRecord::Migration
  def self.up
    remove_column :orders, :base_currency_order_limit 
  end

  def self.down
  end
end
