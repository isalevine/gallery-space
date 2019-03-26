class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.new
      name = "new_user_#{@user.id}"
      @user.user_name = name
    end
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to user_gallery_path(@gallery.user, @gallery.id)
    else
      flash[:error] = @gallery.errors.full_messages.to_sentence
      @user = User.find(gallery_params[:user_id])
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to user_gallery_path(@gallery.user, @gallery.id)
    else
      flash[:error] = @gallery.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @user = @gallery.user
    @gallery.destroy
    render :gallery_deleted
  end

  def gallery_deleted
  end


  def search_for_galleries
  # this method will route to the Gallery Search page
  end


  def view_published_gallery
  # this method will be the SHOW FINAL GALLERY route,
  # separate from having the User view it for editing
    @gallery = Gallery.find(params[:id])
  end



  around_action :catch_not_found

  private



  def gallery_params
    params.require(:gallery).permit!
  end

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to galleries_path, :flash => { :error => "Record not found." }
  end


end
