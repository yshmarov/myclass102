class Enrollment < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  belongs_to :course
  belongs_to :client
  belongs_to :member

  has_many :attendances, ->(obj) { where("#{Attendance.quoted_table_name}.client_id = ?", obj.client_id)}, through: :course #, dependent: :destroy
  #has_many :attendances, through: :client
  #has_many :attendances, through: :course

  has_many :payments, dependent: :destroy
  #belongs_to :coupon

  validates :course_id, :coupon_id, :client_id, :tenant_id, presence: true
  validates_uniqueness_of :client_id, :scope => :course_id

  def to_s
  	id
  end

  def enrpaid
    payments.sum(:amount)
  end

  def enrused
    attendances.map(&:duepayment).sum
  end

  def enrbalance
    enrused - enrpaid
  end

  def created
    created_at.strftime('%d/%m/%Y')
  end

end