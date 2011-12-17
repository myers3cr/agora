class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :headline
      t.text :content
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
