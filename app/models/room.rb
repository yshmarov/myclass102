class Room < ActiveRecord::Base
  belongs_to :office
  belongs_to :tenant
  has_many :events
  acts_as_tenant
  validates :name, :office_id, :tenant_id, presence: true
  def to_s
    name
  end

  def free_plan_can_only_have_one_room
    if self.new_record? && (tenant.rooms.count > 1) && (tenant.plan == 'free')
      errors.add(:base, "Free plans cannot have more than 1 room")
    end
  end
  
end
