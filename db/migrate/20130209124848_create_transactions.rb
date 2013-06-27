class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end

end
