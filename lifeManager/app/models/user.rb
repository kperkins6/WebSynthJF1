class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true
  validates_length_of :name, :minimum => 1, :maximum => 15, :allow_blank => false
  has_many :articles, dependent: :destroy
  belongs_to :checklists
  belongs_to :schedules

  accepts_nested_attributes_for :checklists, :schedules
end
