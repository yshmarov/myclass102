class ProductType < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  has_many :products, dependent: :destroy

  validates :name, :tenant_id, presence: true
  validates :name, uniqueness: true
  
end
