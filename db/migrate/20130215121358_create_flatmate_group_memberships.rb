class CreateFlatmateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :flatmate_group_memberships do |t|
      t.integer :flatmate_id
      t.integer :flatmate_group_id

      t.timestamps
    end
  end
end
