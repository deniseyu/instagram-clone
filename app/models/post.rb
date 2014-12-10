class Post < ActiveRecord::Base

  belongs_to :user 
  has_many :likes
  has_attached_file :image, :styles => { :large => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  

end
