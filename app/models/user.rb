class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :prayers
  has_many :favorite_prayers
  has_many :favorites, through: :favorite_prayers, source: :prayer
  has_many :comments, dependent: :destroy
end
