class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end
  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:product,:explain,:category_id,:state_id,:price,:delivery_cost_status_id,:prefecture_id,:delivery_waiting_time_id,:image).merge(user_id: current_user.id)
  end
end
