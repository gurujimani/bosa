class AddActiveToCommission < ActiveRecord::Migration
  def self.up
		add_column :commissions, :active, :boolean
  end

  def self.down
		remove_column :commissions, :active
  end
end
