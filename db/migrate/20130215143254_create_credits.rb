class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :transaction_id
      t.integer :flatmate_group_id

      t.timestamps
    end
  end
end
