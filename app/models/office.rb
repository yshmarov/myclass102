class Office < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  has_many :rooms
  has_many :events, through: :rooms
  #has_many :cash_collections
  has_many :payments
  validates :name, :tenant_id, presence: true
  validates :name, uniqueness: true
  def to_s
    name
  end
end
