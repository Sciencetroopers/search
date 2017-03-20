class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, :precision => 8, :scale => 2
      t.decimal :price
      t.date :release

      t.timestamps
    end
  end
end
