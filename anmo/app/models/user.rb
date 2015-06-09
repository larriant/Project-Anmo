class User < ActiveRecord::Base

  has_many :events
  has_many :activities

  attr_accessor :remember_token

  before_save { self.email = email.downcase }

  validates :user_name, presence: true, 
                          length: { maximum: 25 },
                      uniqueness: {case_sensitive: true }



  REGEX_EMAIL_VALID = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                      length: { maximum: 80 },
                      format: { with: REGEX_EMAIL_VALID },
                  uniqueness: { case_sensitive: false }
  has_secure_password

  validates :password, presence: true,
                         length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #  Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

end
