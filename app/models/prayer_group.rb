class PrayerGroup < ActiveRecord::Base
	belongs_to :prayer
	belongs_to :group
end
