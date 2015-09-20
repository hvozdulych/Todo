class ItemsController < ApplicationController
  def index

  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:list_id])
    @item = @list.items.new(items_param)

    if @item.save
      redirect_to user_list_path(@user.id, @list.id)
    else
      redirect_to :back
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:list_id])
    @item = @list.items.find(params[:id])

    @item.destroy
    redirect_to user_list_path(@user.id, @list.id)
  end



  private

  def items_param
    params.require(:item).permit(:todo)
  end
end
