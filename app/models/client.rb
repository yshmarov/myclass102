class Client < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  def to_s
    last_name+" "+first_name
  end
  def age
    Time.now.year - dob.year
  end
end
