class TwitterAccount < ApplicationRecord
  belongs_to :user

  # prevent duplicate in username
  validates :username, uniqueness: true
end
