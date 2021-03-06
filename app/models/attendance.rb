class Attendance < ActiveRecord::Base
  acts_as_tenant
  belongs_to :event
  belongs_to :client
  belongs_to :attendance_rate

  validates :client_id, :attendance_rate_id, presence: true
  #validates :client_id, :attendance_rate_id, :event_id, :tenant_id, presence: true
  validates_uniqueness_of :client_id, :scope => :event_id

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

  def duepayment_past
    if event.starts_at < Time.now
      rater*gpricer
    end
  end

  def duepayment_future
    if event.starts_at > Time.now
      rater*gpricer
    end
  end


  def startz
    event.starts_at.to_s
  end
  def endz
    event.ends_at
  end

  def created
    created_at.strftime('%d/%m/%Y')
  end


end