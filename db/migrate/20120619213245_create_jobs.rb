class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :jobname
      t.string :status
      t.string :category
      t.string :customer
      t.string :description
      t.text :instructions
      t.datetime :bid_due
      t.datetime :delivery_due

      t.timestamps
    end
  end
end
