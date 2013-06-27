class AddIsActiveToFlatmateGroup < ActiveRecord::Migration
  def change
    add_column :flatmate_groups, :is_active, :bool
  end
end
