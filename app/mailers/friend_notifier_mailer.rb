class FriendNotifierMailer < ApplicationMailer

  def inform(user)
  @user = user
  #mail(to: friend_email, subject: "#{@user.first_name} is sending you an email")
  mail(to: @user.email, subject: "#{@user.first_name} is sending you an email")
  end

  def invite_email
    @user = params[:user]
    @email = params[:email]
    @name = params[:name]
    mail(to: @email, subject: 'Join Our Stupendous Site')
  end
end
