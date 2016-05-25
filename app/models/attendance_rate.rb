class AttendanceRate < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant

  has_many :attendances

  validates :name, uniqueness: true
  validates :rate, :name, presence: true
  #validates :rate, :name, :tenant_id, presence: true

  def to_s
    name
  end

end