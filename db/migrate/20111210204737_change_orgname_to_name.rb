class ChangeOrgnameToName < ActiveRecord::Migration
  def up
    rename_column :orgs, :org_name, :name
  end

  def down
    rename_column :orgs, :name, :org_name
  end
end