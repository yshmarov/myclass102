class Attendance < ActiveRecord::Base
  belongs_to :event
  belongs_to :client
  belongs_to :attendance_rate
  belongs_to :tenant
  validates :client_id, :attendance_rate_id, :event_id, :tenant_id, presence: true

  #IN EVENTS OR ATTENDANCES
  validates_uniqueness_of :guest_id, :scope => :event_id

  #attendance_rate*it's price
  def rater
  	attendance_rate.rate
  end

  def gpricer
	  event.course.product.client_price
  end

  def duepayment
  	#attendance_rate.rate*event.event_group.service.gprice
    rater*gpricer
  end

  def startz
    event.starts_at
  end


end
