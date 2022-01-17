class ShippingsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_shipping, only: [:index, :create]

  def index
    @shipping_purchase = ShippingPurchase.new
  end

  def create
    @shipping_purchase = ShippingPurchase.new(shipping_params)
    if @shipping_purchase.valid?
       @shipping_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipping_params
    params.permit(:price, :postal, :prefecture_id, :municipality, :address, :building, :phone).merge(user_id: current_user.id)
  end
  def set_shipping
    @image_informations = ImageInformation.find(params[:image_information_id])
  end
end
