class FriendshipsController < ApplicationController
  def create
    user = User.find_by(uid: params[:uid])
    friendship = current_user.friendships.create(user_id:current_user.id, friend_id: user.id)
    if friendship.save
      flash[:notice] = "You have a new friend."
    else
      flash[:error] = "Unable to add existing friend."
    end
    redirect_to "/dashboard"
  end
end
