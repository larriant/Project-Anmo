class User < ActiveRecord::Base

  before_save { self.email = email.downcase }

  validates :name_user, presence: true, length: { maximum: 50 }

  REGEX_EMAIL_VALID = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                      length: { maximum: 255 },
                      format: { with: REGEX_EMAIL_VALID },
                  uniqueness: { case_sensitive: false }
  has_secure_password

  validates :password, presence: true,
                         length: { minimum: 6 }

end
