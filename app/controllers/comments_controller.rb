class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
   @comment = Comment.new(comment_params)
   @comment.user_id = current_user.id
   @comment.movie_id = params[:movie_id]
   if @comment.save
     redirect_to movie_path(params[:movie_id])
   else
   end
 end

 private
   def comment_params
     params.require(:comment).permit(:body)
   end
end
