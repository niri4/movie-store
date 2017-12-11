class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
   @comment = Comment.new(comment_params)
   @comment.user_id = current_user.id
   @comment.movie_id = params[:movie_id]
   if @comment.save
     Thread.new{
       @email = ReviewMail.new
       @m = Movie.find(params[:movie_id])
       @email.thankyou_mail(current_user,@m,@comment)


     }

     redirect_to movie_path(params[:movie_id]),notice: "Review add successfully"
   else
     redirect_to movie_path(params[:movie_id]),alert: "Review cannot Saved"
   end
 end

 private
   def comment_params
     params.require(:comment).permit(:body)
   end
end
