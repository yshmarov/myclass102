class CreateExpences < ActiveRecord::Migration
  def change
    create_table :expences do |t|
      t.belongs_to :member, index: true, foreign_key: true
      t.decimal :amount
      t.belongs_to :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
