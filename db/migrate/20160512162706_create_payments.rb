class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.string :payment_type
      t.belongs_to :enrollment, index: true, foreign_key: true
      t.belongs_to :office, index: true, foreign_key: true
      t.belongs_to :member, index: true, foreign_key: true
      t.belongs_to :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
