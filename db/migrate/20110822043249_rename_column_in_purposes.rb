class RenameColumnInPurposes < ActiveRecord::Migration
  def self.up
    change_table :purposes do |t|
      t.rename :purpose, :name
    end
  end

  def self.down
    change_table :purposes do |t|
      t.rename :name, :purpose
    end
  end
end
