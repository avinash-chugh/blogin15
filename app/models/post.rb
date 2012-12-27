class Post < ActiveRecord::Base
  attr_accessible :body, :title, :tags_attributes
  
  validates_presence_of :body
  validates_presence_of :title
  
  has_many :comments, dependent: :destroy
  has_many :tags
  
  accepts_nested_attributes_for :tags, allow_destroy: true,
    reject_if: proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
