class AttendanceRate < ActiveRecord::Base
  belongs_to :tenant
  has_many :attendances
  acts_as_tenant
  validates :name, uniqueness: true
  validates :rate, :name, :tenant_id, presence: true
  def to_s
    name
  end
end
