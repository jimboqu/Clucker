class Cluck < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true
  validates :body, presence: true, length: { in: 1..280}
  #make sure user is also present
  validates :user, presence: true
  

  #create descending order for clucks. Yes, could have done this in model.
  default_scope { order(created_at: :desc)}

  #method to make username available without running across objects 
  def username
    username = user.username
  end
end
