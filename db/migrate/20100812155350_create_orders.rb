class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.date :date, :null  => false
      t.time :time, :null  => false
      t.references :customer, :null => false
      t.string :receiver_name, :null  => false
      t.string :street, :null  => false
      t.string :city, :null  => false
      t.string :postcode
      t.string :district
      t.string :state
      t.string :country, :null  => false
      t.string :telephone
      t.string :mobile_phone
      t.string :email
      t.decimal :amount, :precision => 10, :scale => 2, :null  => false
      t.decimal :amount_to_deliver, :precision  => 10, :scale  => 2, :null  => false
      t.string :delivery_currency, :null  => false
      t.decimal :ex_rate, :precision  => 10, :scale  => 2, :null  => false
      t.string :delivery_status
      t.datetime :delivered_on
      t.references :agent
      t.decimal :commission, :precision  => 10, :scale  => 2
      t.decimal :charge, :precision  => 10, :scanel  => 2
      t.text :remarks
            
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
