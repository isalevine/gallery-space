class ImagesController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]

  def index
    @images = Image.where(gallery_id: params[:gallery_id])
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
      redirect_to user_gallery_images_path
    else
      flash[:error] = @image.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to user_gallery_images_path(current_user.id, params[:gallery_id])
    else
      flash[:error] = @image.errors.full_messages.to_sentence
      render :edit
  end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to user_gallery_images_path(current_user.id, params[:gallery_id])
  end

  private

  def image_params
    params.require(:image).permit!
  end
end
