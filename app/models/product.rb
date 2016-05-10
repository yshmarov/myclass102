class Product < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  belongs_to :product_type
  has_many :courses, dependent: :destroy

  validates :name, :product_type_id, :tenant_id, presence: true
  validates :name, uniqueness: true

  def productprice
    event_quantity * client_price
  end

  def description
    event_quantity.to_s+product_type.to_s+event_length.to_s+gtype.to_s+productprice.to_s
  end

  def to_s
    description
  end
end
