class ChangeOrgTypeToId < ActiveRecord::Migration
  def up
    change_column :orgs, :org_type, :integer
    rename_column :orgs, :org_type, :org_type_id
  end

  def down
    change_column :orgs, :org_type, :string
    rename_column :orgs, :org_type_id, :org_type
  end
end