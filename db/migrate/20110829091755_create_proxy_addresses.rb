class CreateProxyAddresses < ActiveRecord::Migration
  def self.up
    create_table :proxy_addresses do |t|
      
      t.string :customer, :null => false
      t.string :icno
      t.string :passport
      t.string :customer_mobile
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
      
      t.timestamps
    end
  end

  def self.down
    drop_table :proxy_addresses
  end
end
