class Prayer < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorite_prayers
	has_many :favorited_by, through: :favorite_prayers, source: :user
	has_many :prayer_groups
	has_many :groups, through: :prayer_groups
	accepts_nested_attributes_for :prayer_groups, :allow_destroy => true
end
