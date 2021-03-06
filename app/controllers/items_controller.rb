class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :out_of_stock, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :condition_id, :from_id, :fee_by_id, :timeline_id,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def out_of_stock
    item = Item.find(params[:id])
    redirect_to root_path if item.sale.present?
  end
end
