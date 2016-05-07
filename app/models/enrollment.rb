class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :client
  belongs_to :tenant
  belongs_to :member
  #belongs_to :coupon
  #has_many :payments
  validates :course_id, :client_id, :tenant_id, :member_id, presence: true

  def to_s
  	id
  end

end
