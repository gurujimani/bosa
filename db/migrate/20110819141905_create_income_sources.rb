class CreateIncomeSources < ActiveRecord::Migration
  def self.up
    create_table :income_sources do |t|
      t.string :source, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :income_sources
  end
end
