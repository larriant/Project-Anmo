class Activity < ActiveRecord::Base

  belongs_to :user
  has_many :events

  validates :user_id, presence: true
  validates :activity_name, presence: true

end
