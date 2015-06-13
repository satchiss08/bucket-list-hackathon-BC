class Activity < ActiveRecord::Base
  has_many :products
  has_many :reviews
end