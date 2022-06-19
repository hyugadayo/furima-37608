class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :params_id, only: [:index, :create]

  def index
    @purchase_deliveryinformation = PurchaseDeliveryinformation.new
    redirect_to root_path if current_user.id == @item.user_id || Purchase.exists?(item_id: @item.id)
  end

  def create
    @purchase_deliveryinformation = PurchaseDeliveryinformation.new(purchase_params)
    if @purchase_deliveryinformation.valid?
      pay_item
      @purchase_deliveryinformation.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def params_id
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_deliveryinformation).permit(:postal_code, :prefecture_id, :address, :city, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
