class CreateAgents < ActiveRecord::Migration
  def self.up
    create_table :agents do |t|
      t.string :name, :null  => false
      t.string :address, :null  => false
      t.string :city
      t.string :postcode
      t.string :district
      t.string :state
      t.string :country, :null  => false
      t.string :telephone, :null  => false
      t.string :mobile
      t.string :email
      t.boolean :active
      
      t.timestamps
    end
  end

  def self.down
    drop_table :agents
  end
end
