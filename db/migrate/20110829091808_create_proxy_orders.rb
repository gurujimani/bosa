class CreateProxyOrders < ActiveRecord::Migration
  def self.up
    create_table :proxy_orders do |t|
      t.references :order, :null => false
      t.references :proxy_address, :null => false
      
      t.date :date, :null  => false      
      t.decimal :amount, :precision => 10, :scale => 2, :null  => false
      t.decimal :amount_to_deliver, :precision  => 10, :scale  => 2, :null  => false
      t.string :delivery_currency, :null  => false
      t.decimal :ex_rate, :precision  => 10, :scale  => 2, :null  => false
      t.decimal :commission, :precision  => 10, :scale  => 2
      t.decimal :charge, :precision  => 10, :scanel  => 2
      

      t.timestamps
    end
  end

  def self.down
    drop_table :proxy_orders
  end
end
