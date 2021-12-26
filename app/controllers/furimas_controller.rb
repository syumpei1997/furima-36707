class FurimasController < ApplicationController
  def index
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
        render :new
    end
  end
end
