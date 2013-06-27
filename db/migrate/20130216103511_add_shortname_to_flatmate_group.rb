class AddShortnameToFlatmateGroup < ActiveRecord::Migration
  def change
    add_column :flatmate_groups, :shortname, :string
  end
end
