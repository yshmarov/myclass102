class CreateAttendanceRates < ActiveRecord::Migration
  def change
    create_table :attendance_rates do |t|
      t.string :name
      t.float :rate
      t.belongs_to :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
