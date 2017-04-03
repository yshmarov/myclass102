class AttendanceRate < ActiveRecord::Base
  acts_as_universal
  has_many :attendances

  validates :name, uniqueness: true
  validates :rate, :name, presence: true
  #validates :rate, :name, :tenant_id, presence: true

  def to_s
    name
  end

end