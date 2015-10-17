class ItemsController < ApplicationController
  def index

  end

  def create
    @list = current_user.lists.find(params[:list_id])
    @item = @list.items.new(items_param)

    respond_to do |format|
      if @item.save
        format.html {redirect_to user_list_path(current_user, @list)}
        format.js
      end
    end
  end

  def destroy
    @list = current_user.lists.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html {redirect_to user_list_path(current_user, current_user)}
      format.js
    end
  end



  private

  def items_param
    params.require(:item).permit(:todo)
  end
end
