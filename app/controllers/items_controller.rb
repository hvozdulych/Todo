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
      render 'new'
    end
  end



  private

  def items_param
    params.require(:item).permit(:todo)
  end
end
