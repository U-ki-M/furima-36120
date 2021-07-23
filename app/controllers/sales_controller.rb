class SalesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :out_of_stock, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @sale_shipment = SaleShipment.new
  end

  def create
    @sale_shipment = SaleShipment.new(sale_params)
    if @sale_shipment.valid?
      pay_item
      @sale_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sale_params
    params.require(:sale_shipment).permit(:postal, :from_id, :city, :street, :bldg, :tel).merge(token: params[:token],
                                                                                                user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def out_of_stock
    redirect_to root_path if @item.sale.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: sale_params[:token],
      currency: 'jpy'
    )
  end
end
