class PurchasesController < ApplicationController
  def index
    @purchase_deliveryinformation = PurchaseDeliveryinformation.new
  end

  def create
    @purchase_deliveryinformation = PurchaseDeliveryinformation.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery).permit(:postal_code, :predecture, :address, :city, :building, :phone_number).merge(user_id: current_user.id, item_id: item.id)
  end
end
