class Schedule < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy  

  accepts_nested_attributes_for :events

end
