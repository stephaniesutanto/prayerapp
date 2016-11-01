class InvitesController < ApplicationController

	def create
		@invite = Invite.new(invite_params)
		@invite.sender_id = current_user.id
		if @invite.save
			InviteMailer.new_user_invite(@invite, new_user_registration_url(:invite_token => @invite.token)).deliver
		else
			redirect_to :back, notice: "Unsuccessful"
		end
	end
end
