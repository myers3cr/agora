class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :org_name
      t.string :org_type
      t.integer :currency_id

      t.timestamps
    end
  end
end
