class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :event_quantity
      t.integer :event_length
      t.decimal :member_price
      t.decimal :client_price
      t.string :gtype
      t.string :ctype
      t.boolean :is_active
      t.belongs_to :product_type, index: true, foreign_key: true
      t.belongs_to :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
