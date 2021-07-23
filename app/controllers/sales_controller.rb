class SalesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :out_of_stock, only: [:index]
  before_action :move_to_index, only: [:index]
  

  def index
    
    @sale_shipment = SaleShipment.new
  end

  def create

    @sale_shipment = SaleShipment.new(sale_params)
    if @sale_shipment.valid?
      @sale_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def sale_params
    params.require(:sale_shipment).permit(:postal, :from_id, :city, :street, :bldg, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
    redirect_to root_path
    end
  end

  def out_of_stock
    @item = Item.find(params[:item_id])
    if @item.sale.present?
       redirect_to root_path
    end
  end
end
