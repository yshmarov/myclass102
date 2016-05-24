class Client < ActiveRecord::Base
  belongs_to :tenant
  acts_as_tenant


  has_many :attendances
  has_many :events, through: :attendances
  has_many :enrollments
  has_many :payments, through: :enrollments

  has_many :courses, through: :enrollments
  #has_many :courses, through: :events

  has_many :products, through: :courses
  #has_many :products, through: :enrollments
  #has_many :comments
  has_many :products, through: :enrollments


  validates :email, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, :last_name, :dob, presence: true
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

end