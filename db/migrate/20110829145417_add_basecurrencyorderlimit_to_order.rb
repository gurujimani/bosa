class AddBasecurrencyorderlimitToOrder < ActiveRecord::Migration
  def self.up
    add_column :settings, :base_currency_order_limit, :decimal, :precision  => 10, :scale  => 2
  end

  def self.down
    remove_column :settings, :base_currency_order_limit
  end
end
