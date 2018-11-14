class User < ApplicationRecord
  include Clearance::User
  has_many :clucks, dependent: :destroy
  validates :username, uniqueness: true, presence: true
end
