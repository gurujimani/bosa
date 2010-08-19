class CreateExrates < ActiveRecord::Migration
  def self.up
    create_table :exrates do |t|
      t.references :currency, :null  => false
      t.date :ex_rate_date
      t.decimal :buy_rate
      t.decimal :sell_rate

      t.timestamps
    end
  end

  def self.down
    drop_table :exrates
  end
end
