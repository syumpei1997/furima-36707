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
end
