class Expence < ActiveRecord::Base
  acts_as_tenant
  belongs_to :member
  validates :amount, :member_id, presence: true
end
