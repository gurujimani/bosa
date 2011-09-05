class CreatePurposes < ActiveRecord::Migration
  def self.up
    create_table :purposes do |t|
      t.string :purpose, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :purposes
  end
end
