class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @purchase_deliveryinformation = PurchaseDeliveryinformation.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_deliveryinformation = PurchaseDeliveryinformation.new(purchase_params)
    if @purchase_deliveryinformation.valid?
      @purchase_deliveryinformation.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_deliveryinformation).permit(:postal_code, :prefecture_id, :address, :city, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
