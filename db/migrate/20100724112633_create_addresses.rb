class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :customer, :null  => false
      t.string :contact_person, :null  => false
      t.date :dob
      t.string :sex
      t.string :relationship
      t.string :address, :null  => false
      t.string :city, :null  => false
      t.string :postcode
      t.string :district  
      t.string :state          
      t.string :country, :null  => false
      t.string :telephone
      t.string :mobile
      t.string :email
      
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
