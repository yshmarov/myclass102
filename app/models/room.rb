class Room < ActiveRecord::Base
  belongs_to :office
  belongs_to :tenant
  has_many :events
  acts_as_tenant
  validates :name, :office_id, :tenant_id, presence: true
  def to_s
    name
  end
end
