class ShippingsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_shipping, only: [:index, :create]
  before_action :set_preventurl, only: [:index, :create]

  def index
    @shipping_purchase = ShippingPurchase.new
      if @image_informations.purchase.present? 
        redirect_to root_path
      end

  end

  def create
    @shipping_purchase = ShippingPurchase.new(shipping_params)
    if @shipping_purchase.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @image_informations.price,  
        card: shipping_params[:token],
        currency: 'jpy'
      )
       @shipping_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipping_params
    params.require(:shipping_purchase).permit(:postal, :prefecture_id, :municipality, :address, :building, :phone).merge(user_id: current_user.id, image_information_id: params[:image_information_id], token: params[:token])
  end

  def set_shipping
    @image_informations = ImageInformation.find(params[:image_information_id])
  end

  def set_preventurl
    if current_user == @image_informations.user
      redirect_to root_path
    end
  end
end
