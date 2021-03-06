class Payment < ActiveRecord::Base
  acts_as_tenant
  belongs_to :enrollment
  belongs_to :office
  belongs_to :member
  #belongs_to :client, through: :enrollment

  validates :enrollment_id, :office_id, :amount, presence: true
  validates :amount, :presence => true, :numericality => true

  def created
    created_at.strftime('%d/%m/%Y')
  end

end
