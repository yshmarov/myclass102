class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  #what can not be accessed through mass assignment
  #attr_protected :is_admin
  #attr_accessible :name, :is_admin

  acts_as_universal_and_determines_account
  has_one :member, :dependent => :destroy

  validates :email, uniqueness: true
  def username
    self.email.split(/@/).first
  end
  def to_s
    username
  end

  def is_admin?
    is_admin
  end
    
end
