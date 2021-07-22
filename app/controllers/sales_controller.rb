class SalesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @sale_shipment = SaleShipment.new
  end

  def create
    @sale_shipment = SaleShipment.new(sale_params)
  end

  private
  def sale_params
    params.require(:sale_shipment).permit(:postal, :from_id, :city, :steet, :bldg, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
