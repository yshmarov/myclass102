class Event < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :user
  belongs_to :course
end
