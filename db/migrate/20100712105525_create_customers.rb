class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name, :null  => false
      t.date :dob
      t.string :sex
      t.string :address, :null  => false
      t.string :city, :null  => false
      t.string :district
      t.string :postcode
      t.string :country
      t.string :ic_number
      t.string :passport_number      
      t.string :telephone, :null  => false
      t.string :mobile
      t.string :email     
      
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
