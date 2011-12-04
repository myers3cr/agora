class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :iso_code, :length => 3
      t.string :description, :length => 32

      t.timestamps
    end
  end
end
