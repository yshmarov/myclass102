class CreateAttr2s < ActiveRecord::Migration
  def change
    create_table :attr2s do |t|
      t.string :name
      t.belongs_to :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
