class Event < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :user
  belongs_to :course
  belongs_to :room
  acts_as_tenant

end
