class AddSourceAndPurposeToOrder < ActiveRecord::Migration
  def self.up
		add_column :orders, :purpose_id, :integer
		add_column :orders, :income_source_id, :integer
  end

  def self.down
		remove_column :orders, :income_source_id
		remove_column :orders, :purpose_id
  end
end
