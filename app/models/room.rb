class Room < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant
  belongs_to :office

  has_many :events

  validates :name, :office_id, :tenant_id, presence: true
  validates_uniqueness_of :name, :scope => :tenant_id

  def to_s
    name
  end

  def free_plan_can_only_have_one_room
    if self.new_record? && (tenant.rooms.count > 1) && (tenant.plan == 'free')
      errors.add(:base, "Free plans cannot have more than 1 room")
    end
  end
  
  validate :free_plan_can_only_have_one_room


end
