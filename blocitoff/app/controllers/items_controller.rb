class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.create(item_params)

    if @item.save
      flash[:notice] = "Task was added!"
      redirect_to @user
    else
      flash[:error] = "There was an error saving your item.  Please try again."
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Task was completed!"
      render js: "$('##{@item.id}').hide()"
    else
      flash[:error] = "There was an error deleting that item.  Please try again."
      redirect_to @user
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end