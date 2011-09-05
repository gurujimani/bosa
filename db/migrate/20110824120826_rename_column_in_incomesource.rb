class RenameColumnInIncomesource < ActiveRecord::Migration
  def self.up
    change_table :income_sources do |t|
      t.rename :source, :name
    end
  end

  def self.down
    chage_table :income_sources do |t|
      t.rename :name, :source
    end
  end
end
