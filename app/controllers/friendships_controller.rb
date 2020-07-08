class FriendshipsController < ApplicationController
  def create
    require "pry";binding.pry
    # if @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    #   flash[:notice] = "You have a new friend."
    # else
    #   flash[:error] = "Unable to add existing friend."
    # end
    redirect_to "/dashboard"
  end
end
