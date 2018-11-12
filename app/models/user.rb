class User < ApplicationRecord
  include Clearance::User

  validates :username, uniqueness: true, presence: true
end
