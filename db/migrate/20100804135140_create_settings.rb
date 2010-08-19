class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :company_name, :null  => false
      t.string :street, :null  => false
      t.string :city
      t.string :postcode
      t.string :country
      t.string :telephone
      t.string :mobile
      t.string :email
      t.string :website
      t.string :business_license_no
      t.string :base_currency, :null  => false
      t.string :base_currency_name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
