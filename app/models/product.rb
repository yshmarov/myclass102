class Product < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  belongs_to :product_type
  has_many :courses, dependent: :destroy

  validates :name, :product_type_id, :tenant_id, presence: true
  validates :name, uniqueness: true
end
