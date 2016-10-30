class GroupsController < ApplicationController

def index
	@groups = Group.all
end

def new
	@group = Group.new
end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
   		if @group.save
   			@group.users << current_user
 			redirect_to my_groups_groups_path, notice: "New group created!"
      	else
        	render :new
      	end
  end

 def join
	@group = Group.find(params[:id])
  if current_user.groups.include?(@group)
    redirect_to :back, notice: "You have already joined this group!"
  else
	 @group.users << current_user
 	  if @group.save
 		 redirect_to :back, notice: "You have joined this group!"
 	  else
        format.html { redirect_to(@group, :notice => 'Join error.') }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
 	  end
  end
 end

  def my_groups
    @groups = current_user.groups
  end


 private

   def group_params
      params.require(:group).permit(:groupname)
   end

end
