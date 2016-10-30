class Invite < ActiveRecord::Base
	before_create :generate_token
	belongs_to :group
	belongs_to :sender, :class_name => 'User'
	belongs_to :recipient, :class_name => 'User'
end
