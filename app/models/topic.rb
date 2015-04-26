class Topic < ActiveRecord::Base
  belongs_to :admin
  has_many :post
  belongs_to :user
end
