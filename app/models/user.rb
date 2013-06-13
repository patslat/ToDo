require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessible :name, :password

  has_many :team_memberships,
           :foreign_key => :member_id
  has_many :teams, :through => :team_memberships

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
  end
end
