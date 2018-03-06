class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.strip.downcase).try(:authenticate, password)
  end

  validates :password, length: { in: 6..20 } 
  validates :first_name, 
            :last_name, 
            :email, presence: true
  validates :email, uniqueness: true
  validates :email, uniqueness: {case_sensitive: false}
end
