class CreateOpenItems < ActiveRecord::Migration
  def change
    create_table :open_items do |t|
      t.integer :quantity
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
