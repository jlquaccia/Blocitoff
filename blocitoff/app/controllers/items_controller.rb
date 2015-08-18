class ItemsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    item = user.items.create(:item)

    if item.save
      flash[:notice] = "Item was saved."
      redirect_to user_path
    else
      flash[:error] = "There was an error saving your item.  Please try again."
      redirect_to user_path
    end
  end
end
