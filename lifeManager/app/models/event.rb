class Event < ActiveRecord::Base
  belongs_to :schedule
  validates :eventType, presence: true
  validates :title, presence: true
  validates :schedule_id, presence: true
end
