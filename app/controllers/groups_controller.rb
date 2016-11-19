class GroupsController < ApplicationController
  before_action :authenticate_user!

def index
	@groups = Group.all
end

def new
	@group = Group.new
end  

def edit
  @group = Group.find(params[:id])
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

def update
  @group = Group.find(params[:id])
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_prayers_path(@group), notice: 'Group name was successfully updated.' }
      else
        format.html { render :edit }
      end
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

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_groups
    @groups = current_user.try(:groups)
  end


 private

   def group_params
      params.require(:group).permit(:groupname)
   end

end
