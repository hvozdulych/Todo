class ListsController < ApplicationController

  def index
    @lists = current_user.lists.all
    @list = List.new

    respond_to do |format|
      format.html # index.html.erb
      format.json {render :json => {:lists => @lists, :user => current_user} }
    end
    
  end

  def show
    @list  =current_user.lists.find(params[:id])
    @items = @list.items.all
    @item  = Item.new
  end

  def new
    @list =current_user.lists.new
  end

  def create
    @list = current_user.lists.create!(list_params)

    respond_to do |format|
      format.html { redirect_to action: :index }
      format.js
    end  
  end

  def update
    @list =current_user.lists.find(params[:id])

    if @list.update_attributes(list_params)
      redirect_to user_list_path
    else
      render 'show'
    end
  end

  def destroy
    @list  =current_user.lists.find(params[:id])
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
