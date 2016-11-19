class InvitesController < ApplicationController
	def new
		@group = Group.find(params[:group_id])
		@invite = @group.invites.new
	end

	def create
		@invite = Invite.new(invite_params)
		@invite.sender = current_user
		@invite.recipient = User.find_by(email: @invite.email)
		@invite.group = Group.find(params[:group_id])

		if @invite.save
			InviteMailer.invite_to_group(@invite).deliver_now
			redirect_to :back, notice: "Invitation sent!"
		end

		# if @invite.save
		# 	InviteMailer.new_user_invite(@invite, new_user_registration_url(:invite_token => @invite.token)).deliver
		# else
		# 	redirect_to :back, notice: "Unsuccessful"
		# end
	end

	def verify
		@invite = Invite.find_by(token: params[:token])
		@group = @invite.group

		if @invite.recipient.present?

		  if @invite.recipient.groups.include?(@group)
			redirect_to group_prayers_path(@group), notice: "You have already joined this group!"
		  else
			@group.users << @invite.recipient
     		redirect_to group_prayers_path(@group), notice: "You joined #{@group.groupname}!"
  		  end

			# join group and redirect user somewhere
		else
			redirect_to new_user_registration_path(redirect: request.path)
			# redirect to register page
		end
	end

	private
	def invite_params
		params.require(:invite).permit(:email)
	end
end
