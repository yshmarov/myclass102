class ProductType < ActiveRecord::Base
  acts_as_tenant

  has_many :products, dependent: :destroy

  validates :name, :tenant_id, presence: true
  validates :name, uniqueness: true

  def to_s
    name
  end

end
