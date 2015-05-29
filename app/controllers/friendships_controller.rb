class FriendshipsController < ApplicationController
  
  def index
    # friendships = Friendship.where(user_id: current_user.id, status: "active")
    # friendships2 = Friendship.where(friend_id: current_user.id, status: "active")
    # @friends = []
    # friendships.each do |friendship|
    #   @friends << User.find(friendship.friend_id)
    # end
    # friendships2.each do |friendship|
    #   @friends << User.find(friendship.user_id)
    # end
    friendships = Friendship.where(user_id: current_user.id, status: "active")
    friendships2 = Friendship.where(friend_id: current_user.id, status: "active")

    @friends = User.where(id: friendships.map(&:friend_id)).to_a + User.where(id: friendships2.map(&:user_id)).to_a

    @incoming_requests = Friendship.where(friend_id: current_user.id, status: "request")
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id] )
    if @friendship.save
      flash[:notice] = "request has been sent."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end


  def my_requests
    @incoming_requests = Friendship.where(friend_id: current_user.id, status: "request")
  end

  def accept_friendship
    @friendship = Friendship.find(params[:id])
    @friendship.status = "active"
    @friendship.save
    redirect_to friendships_path
  end


end
