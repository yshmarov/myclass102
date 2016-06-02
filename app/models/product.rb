class Product < ActiveRecord::Base
  acts_as_tenant
  belongs_to :product_type

  has_many :courses, dependent: :destroy

  validates :product_type_id, :event_length, :event_quantity, :member_price, :client_price, :gtype, :tenant_id, presence: true
  #validates :name, uniqueness: true

  def productprice
    event_quantity * client_price
  end

  def description
    product_type.to_s+'/'+gtype.to_s+'/'+event_length.to_s+'('+event_quantity.to_s+'*'+client_price.to_i.to_s+'='+productprice.to_i.to_s+')'
    #event_quantity.to_s+"/"+product_type.to_s+event_length.to_s+gtype.to_s+productprice.to_s
  end

  def to_s
    description
  end

  def self.active
    where(is_active: true)
  end

  def self.inactive
    where(is_active: false)
  end

  def self.active_or_id(record_id)
    where('id = ? OR (is_active=true)', record_id)    
  end

  def created
    created_at.strftime('%d/%m/%Y')
  end

  #validates_uniqueness_of :description, :scope => :tenant_id

end
