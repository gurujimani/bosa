class CreateCommissions < ActiveRecord::Migration
  def self.up
    create_table :commissions do |t|
      t.decimal :from_amount, :precision => 10, :scale => 2
      t.decimal :to_amount, :precision => 10, :scale => 2
      t.decimal :commission, :precision => 10, :scale => 2
      t.decimal :charge, :precision => 10, :scale => 2
      t.text :remarks      
      t.timestamps
    end
  end

  def self.down
    drop_table :commissions
  end
end
