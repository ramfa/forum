class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments
  has_many :favorites
end
