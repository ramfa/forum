class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :posts
has_many :topics
has_many :comments
has_many :favorites

def favorite?(post_id)
 if favorites.where(post_id: post_id).first
 	true
  else
 	false
 end
end
end
