# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
  has_many :twitter_accounts # association with twitter account
  has_secure_password # rails feature that gives us that .authenticate() method

  validates :email, presence: true, format: {
    with: /\A[^@\s]+@[^@\s]+\z/,
    message: "must be a valid email"
  }
end
