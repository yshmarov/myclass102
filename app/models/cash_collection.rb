class CashCollection < ActiveRecord::Base

  acts_as_tenant
  belongs_to :office
  validates :office_id, :amount, presence: true
end
