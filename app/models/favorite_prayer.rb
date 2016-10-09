class FavoritePrayer < ActiveRecord::Base
	belongs_to :prayer
	belongs_to :user
end
