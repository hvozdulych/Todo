class ListsController < ApplicationController
  def index
    @user = current_user
    @lists = @user.lists.all
  end

  def show
    @user  = current_user
    @list  = @user.lists.find(params[:id])
    @items = @list.items.all
    @item  = Item.new
  end

  def new
    @user = current_user
    @list = @user.lists.new
  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.new(list_params)

    if @list.save
      redirect_to user_lists_path
    else
      render 'new'
    end
  end


  private

    def list_params
      params.require(:list).permit(:title)
    end
end
