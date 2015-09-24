class ListsController < ApplicationController
  
  before_action :set_current_user, only: [:index, :show, :new, :destroy]

  def set_current_user
    @user = current_user
  end

  def index
    @lists = @user.lists.all
    @list = List.new

    respond_to do |format|
      format.html # index.html.erb
      format.json {render :json => {:lists => @lists, :user => @user} }
    end
    
  end

  def show
    @list  = @user.lists.find(params[:id])
    @items = @list.items.all
    @item  = Item.new
  end

  def new
    @list = @user.lists.new
  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.create!(list_params)

    respond_to do |format|
      format.html { redirect_to action: :index }
      format.js
    end  
  end

  def update
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:id])

    if @list.update_attributes(list_params)
      redirect_to user_list_path
    else
      render 'show'
    end
  end

  def destroy
    @list  = @user.lists.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to action: :destroy }
      format.js
    end 

    
    
  end

  private

    def list_params
      params.require(:list).permit(:title)
    end
end
