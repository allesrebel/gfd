class User < ApplicationRecord

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, :with => URI::MailTo::EMAIL_REGEXP

  passwordless_with :email
end
