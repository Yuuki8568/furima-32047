class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                  null: false
      t.integer :price,                null: false
      t.text :description,             null: false
      t.integer :condition_id,         null: false, foreign_key: true
      t.integer :category_id,          null: false, foreign_key: true
      t.integer :shipping_area_id,     null: false, foreign_key: true
      t.integer :postage_type_id,      null: false, foreign_key: true
      t.integer :preparation_day_id,   null: false, foreign_key: true
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
