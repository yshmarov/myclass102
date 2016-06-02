class Office < ActiveRecord::Base
  acts_as_tenant

  has_many :rooms
  has_many :events, through: :rooms
  has_many :payments
  #has_many :cash_collections

  validates :name, :tenant_id, presence: true
  validates_uniqueness_of :name, :scope => :tenant_id

  def to_s
    name
  end
end
