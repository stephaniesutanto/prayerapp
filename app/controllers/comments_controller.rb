class CommentsController < ApplicationController
 before_action :find_prayer
 before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
 before_action :comment_owner, only: [:destroy, :edit, :update]
 def create
 	@comment = @prayer.comments.create(params[:comment].permit(:content))
 	@comment.user_id = current_user.id
 	@comment.save

 	if @comment.save
 		redirect_to prayer_path(@prayer)
 	else
 		render 'new'
 	end
 end

 def destroy
 	@comment.destroy
 	redirect_to prayer_path(@prayer)
 end

 def edit

 end


 def update
 	if @comment.update(params[:comment].permit(:content))
 		redirect_to prayer_path(@prayer)
 	else
 		render 'edit'
 	end
 end

 private

 def find_prayer
 	@prayer = Prayer.find(params[:prayer_id])
 end

 def find_comment
 	@comment = @prayer.comments.find(params[:id])
 end

 def comment_owner
 	unless current_user.id == @comment.user_id
 		flash[:notice] = "You are not authorized"
 		redirect_to @prayer
 	end
 end

end
