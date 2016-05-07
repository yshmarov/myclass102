class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.belongs_to :course, index: true, foreign_key: true
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :tenant, index: true, foreign_key: true
      t.belongs_to :member, index: true, foreign_key: true
      t.integer :coupon_id

      t.timestamps null: false
    end
  end
end
