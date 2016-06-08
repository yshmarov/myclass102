class Member < ActiveRecord::Base
  belongs_to :user
  acts_as_tenant
  has_many :events

  #for product.member_price
  has_many :courses, through: :events
  has_many :products, through: :courses

  #to see that he was responsible for obtaining money
  has_many :payments
  has_many :expences
  #has_many :cash_collections

  def to_s
    last_name+" "+first_name
  end

  def to_ss
    last_name+" "+first_name+" "+middle_name
  end

  def total_member_event_price
    products.sum(:member_price)
  end

  def total_member_event_price_past
    events.where('starts_at < ?', Time.now).order('starts_at ASC').map(&:member_event_price).sum  
  end

  def total_member_event_price_future
    events.where('starts_at > ?', Time.now).order('starts_at ASC').map(&:member_event_price).sum  
  end

  def paid
    expences.sum(:amount)
  end
  
  def balance
    paid - total_member_event_price_past
  end
  
  def to_pay
    total_member_event_price - paid
  end

  DEFAULT_ADMIN = {
    first_name: "Admin",
    last_name:  "Please edit me"
  }

  def self.create_new_member(user, params)
    # add any other initialization for a new member
    return user.create_member( params )
  end

  def self.create_org_admin(user)
    new_member = create_new_member(user, DEFAULT_ADMIN)
    unless new_member.errors.empty?
      raise ArgumentError, new_member.errors.full_messages.uniq.join(", ")
    end
    return new_member
  end

end
