class ReviewMail

  def thankyou_mail(user,movie,comment)
      ReviewMailer.thankyou_email(user,movie,comment).deliver_now
  end
end
