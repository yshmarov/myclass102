class Course < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  belongs_to :attr1
  belongs_to :attr2
  belongs_to :attr3
  belongs_to :product

  has_many :enrollments, dependent: :destroy
#for nested attendances
  has_many :clients, through: :enrollments
#event list and calendar, nested events
  has_many :events, dependent: :destroy
#nested events. not needed?
  has_many :rooms, through: :events
#calculations
  has_many :attendances, through: :events
#payment list
  has_many :payments, through: :enrollments

  #validates :name, uniqueness: true
  validates_uniqueness_of :name, :scope => :tenant_id
  validates :name, :product_id, presence: true

  validate :free_plan_can_only_have_one_course

  def to_s
    name
  end  

#tenant plan options
  def free_plan_can_only_have_one_course
    if self.new_record? && (tenant.courses.count > 1) && (tenant.plan == 'free')
      errors.add(:base, "Free plans cannot have more than 2 courses")
    end
  end

#tenant plan views
  def self.by_plan_and_tenant(tenant_id)
    tenant = Tenant.find(tenant_id)
    if tenant.plan == 'premium'
      tenant.courses
    else
      tenant.courses.order(:id).limit(10)
    end
  end

#  accepts_nested_attributes_for :enrollments, reject_if: proc { |attributes| attributes ['coupon_id'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :events, reject_if: proc { |attributes| attributes ['room_id'].blank? }, allow_destroy: true

end