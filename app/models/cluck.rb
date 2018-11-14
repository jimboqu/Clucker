class Cluck < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 1..280}
  #make sure user is also present
  validates :user, presence: true
end
