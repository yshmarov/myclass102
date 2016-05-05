class AttendanceRate < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  validates :name, :rate, :tenant_id, presence: true
  def to_s
    name
  end
end
