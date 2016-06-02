class Attr1 < ActiveRecord::Base
  acts_as_tenant

  has_many :courses

  validates :name, uniqueness: true, presence: true

  def to_s
    name
  end

end
