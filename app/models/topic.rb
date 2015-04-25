class Topic < ActiveRecord::Base
  belongs_to :admin
  has_many :post
end
