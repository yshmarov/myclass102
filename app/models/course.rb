class Course < ActiveRecord::Base
  belongs_to :tenant
  has_many :events, dependent: :destroy
  
  validates_uniqueness_of :name
  validate :free_plan_can_only_have_one_course
  
  def free_plan_can_only_have_one_course
    if self.new_record? && (tenant.courses.count > 1) && (tenant.plan == 'free')
      errors.add(:base, "Free plans cannot have more than 2 courses")
    end
  end
  
  def self.by_plan_and_tenant(tenant_id)
    tenant = Tenant.find(tenant_id)
    if tenant.plan == 'premium'
      tenant.courses
    else
      tenant.courses.order(:id).limit(10)
    end
  end

  accepts_nested_attributes_for :events, reject_if: proc { |attributes| attributes ['room_id'].blank? }, allow_destroy: true

end