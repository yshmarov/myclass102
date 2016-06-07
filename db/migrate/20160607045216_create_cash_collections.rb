class CreateCashCollections < ActiveRecord::Migration
  def change
    create_table :cash_collections do |t|
      t.belongs_to :office, index: true, foreign_key: true
      t.float :amount
      t.belongs_to :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
