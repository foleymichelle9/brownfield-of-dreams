class UsersController < ApplicationController

  def show
    if !current_user.github_token.nil?
      search_results = SearchResults.new(current_user.github_token)
      @repos = search_results.repos
      @followers = search_results.followers
      @followings = search_results.followings
      @invitee = search_results.get_email_and_name(params[:github_handle], current_user.github_token)

    if @invitee[0]
      EmailSenderMailer.with(user: current_user, email: @invitee[0], name: @invitee[1]).invite_email.deliver_now

      flash.now[:success] = 'Successfully sent invite!'
    else
      flash.now[:error] = "The Github user you selected doesn't have an email address associated with their account."
    end
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
      FriendNotifierMailer.inform(user).deliver_now
    else
      flash[:error] = user.errors.full_messages.to_sentence
      #render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
