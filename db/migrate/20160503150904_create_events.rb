class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :starts_at
      t.integer :room_id
      t.belongs_to :member, index: true, foreign_key: true
      t.belongs_to :course, index: true, foreign_key: true
      t.belongs_to :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
