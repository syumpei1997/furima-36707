class ImageInformationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_image_information, only: [:edit, :show, :update, :destroy]

  def index
     @image_informations = ImageInformation.all.order(created_at: :desc)
  end

  def new
    @image_information = ImageInformation.new
  end

  def create
    @image_information = ImageInformation.new(image_information_params)
    if @image_information.save
      redirect_to root_path
    else
        render :new
    end
  end

  def show
  end

  def edit
    if current_user != @image_information.user
      redirect_to root_path
    end
    if @image_information.purchase.present? 
      redirect_to root_path
    end
  end

  def update
    if @image_information.update(image_information_params)
      redirect_to root_path
    else
    render :edit
    end
  end

  def destroy
    if current_user == @image_information.user
      @image_information.destroy
    end
    redirect_to root_path
  end

  private

  def image_information_params
    params.require(:image_information).permit(:image, :image_name, :image_explanation, :price, :category_id, :delivery_id, :nissuu_id, :prefecture_id, :status_id).merge(user_id: current_user.id)
  end

  def set_image_information
    @image_information = ImageInformation.find(params[:id])
  end
end
