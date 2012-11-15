class Post < ActiveRecord::Base
  attr_accessible :content, :title, :tags_attributes, :image
  has_many :comments, :dependent => :destroy
  has_many :tags
  has_attached_file :image
 
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
end
