class AddIsPersonalToFlatmateGroup < ActiveRecord::Migration
  def change
    add_column :flatmate_groups, :is_personal, :bool
  end
end
