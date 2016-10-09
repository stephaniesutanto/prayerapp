class Prayer < ActiveRecord::Base
	belongs_to :user
	#added by user
	has_many :favorite_prayers
	has_many :favorited_by, through: :favorite_prayers, source: :user
end
