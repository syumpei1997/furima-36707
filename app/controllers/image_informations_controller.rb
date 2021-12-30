class ImageInformationsController < ApplicationController
  def index
    @image_informations = ImageInformation.includes(:user)
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

  private

  def image_information_params
    params.require(:image_information).permit(:image, :image_name, :image_explanation, :price, :category_id, :delivery_id, :nissuu_id, :prefecture_id, :status_id).merge(user_id: current_user.id)
  end

end
