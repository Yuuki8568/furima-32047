class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code,        null: false
      t.integer     :postal_code_id,     null: false
      t.string      :municipality_code,  null: false
      t.text        :address,            null: false, foreign_key: true
      t.string      :phone_number,       null: false
      t.string      :building_code
      t.references  :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
