class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  before_save { self.name = name.downcase }
  validates :name, presence: true, length: {minimum: 5, maximum: 15}, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[\w]+\.[a-z]+\z/i  #сравнить с тем, что в учебнике - 6 гл.
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
  	Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
    	self.remember_token=User.encrypt(User.new_remember_token)
    end
    
end
