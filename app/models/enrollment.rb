class Enrollment < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  belongs_to :course
  belongs_to :client
  belongs_to :member

  has_many :events, through: :attendances
  has_many :attendances, through: :client

  has_many :payments, dependent: :destroy

  #belongs_to :coupon
  #has_many :payments
  validates :course_id, :client_id, :tenant_id, :member_id, presence: true
  def to_s
  	id
  end


  #def enrollmenttotalduepaymentclientz
  #  @enrollment.attendancesattendances.map(&:duepayment).sum
  #end

end
