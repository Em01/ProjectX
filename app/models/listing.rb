class Listing < ActiveRecord::Base
	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  belongs_to :seller, class_name: 'User'
  has_and_belongs_to_many :buyers, class_name: 'User', association_foreign_key: 'buyer_id', join_table: 'buyers_listings'

  field :coordinates, :type => Array
  field :address

  include Geocoder::Model::Mongoid 
  geocoded_by :location
  after_validation :geocode  

end
