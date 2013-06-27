class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.integer :transaction_id
      t.integer :flatmate_group_id

      t.timestamps
    end
  end
end
