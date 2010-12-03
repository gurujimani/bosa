class AddUserlevelToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :userlevel, :string
  end

  def self.down
    remove_column :users, :userlevel
  end
end
