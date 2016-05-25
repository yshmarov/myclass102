class Attr1 < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant

  has_many :courses

  validates :name, uniqueness: true, presence: true

  def to_s
    name
  end

end
