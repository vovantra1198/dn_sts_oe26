class UserMailer < ApplicationMailer
  def confirm_email user_email, session
    @session = session
    mail to: user_email, subject: t(".subject")
  end
end
