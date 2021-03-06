class Course < ActiveRecord::Base
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

  def total_used_course
    attendances.map(&:duepayment).sum
  end
  
  def total_paid_course
    payments.map(&:amount).sum
  end
  
  def total_balance_course
    total_paid_course - total_used_course
  end

#tenant plan options
  def free_plan_can_only_have_one_course
    if self.new_record? && (tenant.courses.count > 1) && (tenant.plan == 'free')
      errors.add(:base, "Free plans cannot have more than 2 courses")
    end
  end

#  accepts_nested_attributes_for :enrollments, reject_if: proc { |attributes| attributes ['coupon_id'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :events, reject_if: proc { |attributes| attributes ['room_id'].blank? }, allow_destroy: true

end