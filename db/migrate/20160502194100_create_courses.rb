class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :product_id
      t.integer :attr1_id
      t.integer :attr2_id
      t.integer :attr3_id
      t.belongs_to :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
