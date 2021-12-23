class ImageInformationController < ApplicationController
  
  def new
    @image_information = Image_information.new
    redirect_to root_path unless current_user.id == @image_informations.user_id
  end
  
  def create
    @image_information = Image_information.new(image_infomation_params)
    if @image_information.save
        render 'index'
    else
        render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
