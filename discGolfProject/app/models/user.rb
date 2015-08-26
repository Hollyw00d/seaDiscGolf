class User < ActiveRecord::Base
  has_secure_password
  has_many :comments, dependent: :destroy
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  before_validation :downcase_email
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, presence:true, uniqueness:true, format: { with: EMAIL_REGEX }
  validates :user_type, presence:true
  validates :password, presence:true, confirmation:true
  validates_confirmation_of :password

private
	def downcase_email
		self.email = self.email.downcase if self.email.present?
	end
end
