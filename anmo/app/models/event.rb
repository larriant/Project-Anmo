class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :activity

  validates :user_id, presence: true
  validates :event_name, presence: true

end
