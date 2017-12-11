class ReviewMailer < ApplicationMailer
  def thankyou_email(user,movie,comment)
    @user = user
    @movie = movie
    @comment = comment
    mail(to: @user.email, subject: "Thanks for your Time to Review #{@movie.title.titleize}")
  end
end
