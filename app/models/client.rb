class Client < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant

  has_many :attendances
  has_many :enrollments
#right way??????????????????????????????????????????????
  has_many :payments, through: :enrollments
#what for?
  #has_many :events, through: :attendances
#what for?
  has_many :courses, through: :enrollments
#wrong way
  #has_many :courses, through: :events
#what for?
  #has_many :products, through: :courses
  #has_many :products, through: :enrollments

  #has_many :comments

  validates :email, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, :last_name, presence: true
  validates :tel1, :tel2,
                       :numericality => true,
                       :allow_blank => true,
                       :length => { :minimum => 5, :maximum => 13 }

  def to_s
    last_name+" "+first_name
  end

  def to_ss
    last_name+" "+first_name+" "+middle_name
  end

  def age
    Time.now.year - dob.year
  end

  def born
    dob.strftime('%d/%m/%Y')
  end

  def created
    created_at.strftime('%d/%m/%Y')
  end

end