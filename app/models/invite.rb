class Invite < ActiveRecord::Base
	before_create :generate_token
	belongs_to :group
	belongs_to :sender, :class_name => 'User'
	belongs_to :recipient, :class_name => 'User'

	def generate_token
		self.token = Digest::SHA1.hexdigest([self.group_id, Time.now, rand].join)
	end
end
