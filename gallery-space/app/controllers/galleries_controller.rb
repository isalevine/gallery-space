class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  # see FriendlyCharacterGenerator for if/else
  # re: passing in a @user to the new @gallery object
  # (reference the BaseCharacter#new controller/method)
  def new
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.new
    end
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to @gallery
    else
      # flash[:error] = @gallery.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to @gallery
    else
      # flash[:error] = @gallery.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect to gallery_deleted_path
  end

  # def gallery_deleted
  #   (see FriendlyCharacterGenerator code)
  # end



  # around_action :catch_not_found

  private



  def gallery_params
    params.require(:gallery).permit!
  end

  # def catch_not_found
  #   yield
  # rescue ActiveRecord::RecordNotFound
  #   redirect_to galleries_path, :flash => { :error => "Record not found." }
  # end


end
