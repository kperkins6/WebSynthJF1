class Article < ActiveRecord::Base
  require "net/http"
  validates :name, presence: true
  validates :url, presence: true
  validates :user_id, presence: true
  #validate :is_real
  belongs_to :user
  has_many :tags, dependent: :destroy  
 
  accepts_nested_attributes_for :tags
   
  private 
  def prePend
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "https://#{self.url}"
    end 
  end 

  def is_real
    prePend
    uri = URI(self.url)
    req = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP.get_response uri

    if req.code.to_i != 200
      errors.add(self.url, "Site did not return a valid response code")
    end

  end  

end
