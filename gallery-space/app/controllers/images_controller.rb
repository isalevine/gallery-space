class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to image_path
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.save
    @image.update(image_params)
    redirect_to image_path(@image)
  else
    render :new
  end
  end

  # def destroy
  #   @image.find(params[:id]).destroy
  # end

  private

  def image_params
    params.require(:image).permit!
  end
end
