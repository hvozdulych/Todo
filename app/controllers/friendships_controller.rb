class FriendshipsController < ApplicationController
  
  def index
    puts "cr = #{current_user.inspect}"
    friends = Friendship.where(user_id: current_user.id)
    p friends.inspect
    @friends = []
    friends.each do |friend|
      @friends << User.find(friend.friend_id)
    end
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id] )
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end


end
