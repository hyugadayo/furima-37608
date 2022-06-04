class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :params_id, only: [:show]
  def index
    @items = Item.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:product, :explain, :category_id, :state_id, :price, :delivery_cost_status_id, :prefecture_id,
                                 :delivery_waiting_time_id, :image).merge(user_id: current_user.id)
  end
  def params_id
    @item = Item.find(params[:id])
  end
end
