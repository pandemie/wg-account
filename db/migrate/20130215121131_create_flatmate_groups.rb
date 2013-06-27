class CreateFlatmateGroups < ActiveRecord::Migration
  def change
    create_table :flatmate_groups do |t|
      t.string :name
      t.timestamps
    end
  end
end
