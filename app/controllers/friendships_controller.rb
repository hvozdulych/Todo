class FriendshipsController < ApplicationController
  
  def index
<<<<<<< HEAD
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
    @friends = User.where(id: friendships.map(&:friend_id))
=======
    friendships = Friendship.where(user_id: current_user.id, status: "active")
    friendships2 = Friendship.where(friend_id: current_user.id, status: "active")
    @friends = []
    friendships.each do |friendship|
      @friends << User.find(friendship.friend_id)
    end
    friendships2.each do |friendship|
      @friends << User.find(friendship.user_id)
    end

>>>>>>> master
    @incoming_requests = Friendship.where(friend_id: current_user.id, status: "request")
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:user])
    unless Friendship.exists?(:user_id => @friendship.friend_id, :friend_id => current_user.id)
      if @friendship.save
        flash[:notice] = "request has been sent."
        redirect_to root_url
      else
        flash[:notice] = "Unable to add friend."
        redirect_to users_path
      end
    else
      flash[:notice] = "This user has already sent you request. You can confirm or reject it in your incoming requests"
      redirect_to users_path
    end
  end

  # def update
  #   @friendship = Friendship.find
  # end

  def my_requests
    @incoming_requests = Friendship.where(friend_id: current_user.id, status: "request")
  end

  def accept_friendship
    @friendship = Friendship.find(params[:id])
    @friendship.status = "active"
    @friendship.save
    redirect_to friendships_path
  end


  def my_requests
    @incoming_requests = Friendship.where(friend_id: current_user.id, status: "request")
  end

  def accept_friendship
    @friendship = Friendship.find(params[:id])
    @friendship.status = "active"
    if @friendship.save
      Friendship.create(:user_id => @friendship.friend_id, :friend_id => @friendship.user_id, :status => "active")
      redirect_to friendships_path
    end
  end

  def reject_friendship
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to friendships_path
  end


end
