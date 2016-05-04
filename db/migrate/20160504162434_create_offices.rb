class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :tel
      t.references :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
