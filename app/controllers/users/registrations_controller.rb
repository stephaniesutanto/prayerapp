class Users::RegistrationsController < Devise::RegistrationsController
	def create
	 super
	end

   protected
   def after_sign_up_path_for(resource)
   	 @redirect = params[:redirect]

   	 if @redirect.present?
   	 	@token = @redirect.split("/")[2]
   	 	@invite = Invite.find_by(token: @token)
   	 	@group = @invite.group
   	 	@invite.update_attributes(recipient_id: resource.id)
   	 	@group.users << @invite.recipient
   	 	@redirect
   	 else
	    after_sign_in_path_for(resource)
   	 end
   end
end