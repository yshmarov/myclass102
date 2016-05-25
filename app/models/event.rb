class Event < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  belongs_to :member
  belongs_to :course
  belongs_to :room

  has_many :attendances, dependent: :destroy
  has_many :clients, through: :attendances
  

  validates :member_id, :starts_at, :room_id, presence: true
  #validates :member_id, :starts_at, :room_id, :course_id, :tenant_id, presence: true
  validates_time :starts_at, :between => '9:00am'..'7:00pm'

  accepts_nested_attributes_for :attendances, reject_if: proc { |attributes| attributes ['attendance_rate_id'].blank? }, allow_destroy: true

  def ends_at
  	starts_at + course.product.event_length*60
  end

  def to_s
  	id
  end

  def member_event_price
    course.product.member_price
  end

  def eventused
    attendances.map(&:duepayment).sum
  end

end