class UserMailer < ApplicationMailer


  def welcome_email
    byebug
    from = params.user
    to = User.find_by(id: params.receiver_id).email
    mail(to: to, from: from, subject: 'Welcome to the Ultimate Campus Experience!')
  end
end
