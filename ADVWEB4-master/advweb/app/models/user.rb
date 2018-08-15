class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  has_many :reports, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, authentication_keys: [:login]

  VALID_NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/
  validates :age, presence: true, numericality: { only_integer: true }
  validates :age, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :first_name, :with => VALID_NAME_REGEX
  validates_format_of :last_name, :with => VALID_NAME_REGEX
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username
  validates :email, presence: true, length: { maximum: 255 },
            format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create },
            uniqueness: true


  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
