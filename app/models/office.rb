class Office < ActiveRecord::Base
  belongs_to :tenant
  has_many :rooms
  has_many :events, through: :rooms
  acts_as_tenant
  validates :name, :tenant_id, presence: true
  validates :name, uniqueness: true
  def to_s
    name
  end
end
