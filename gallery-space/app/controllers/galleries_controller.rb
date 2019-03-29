class GalleriesController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :show, :search_for_galleries, :search_results, :view_published_gallery, :view_image_details]

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
    if params[:user_id]
      # current_user is a helper method available in
      # the view (no @user object needed)

    # is this Else option only for TESTING?? can we
    # remove?? (only logged-in users should create Galleries...)
    # else
    #   @user = User.new
    #   name = "new_user_#{@user.id}"
    #   @user.user_name = name
    end
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      default_setting = Setting.create(gallery_id: @gallery.id, theme_name: "default", background_color: "white", font: "Times New Roman")
      @gallery.current_setting_id = default_setting.id
      @gallery.save
      flash[:message] = "New gallery created successfully!"
      redirect_to user_gallery_path(@gallery.user, @gallery.id)
    else
      flash[:error] = @gallery.errors.full_messages.to_sentence
      # current_user is a helper method available in
      # the view (no @user object needed)
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      flash[:message] = "Gallery successfully updated!"
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
  end

  def search_results
    if params[:search][:user_name]
      @user = User.find_by(user_name: params[:search][:user_name])
      @galleries = Gallery.where(user_id: @user.id)
    elsif params[:search][:theme]
      @galleries = Gallery.where(theme: params[:search][:theme])
    elsif params[:search][:name]
      @galleries = Gallery.where(name: params[:search][:name])
    end
  end

  def view_published_gallery
  # this method will be the SHOW FINAL GALLERY route,
  # separate from having the User view it for editing
    @gallery = Gallery.find(params[:id])
    if Setting.exists?(id: @gallery.current_setting_id)
      @settings = Setting.find(@gallery.current_setting_id)
    else
      @settings = Setting.create(gallery_id: @gallery.id, theme_name: "default", background_color: "white", font: "Times New Roman")
    end
    @images = Image.where(gallery_id: @gallery.id).order(:id)
    @gallery_owner = User.find(@gallery.user_id)
  end

  def view_image_details
    @gallery = Gallery.find(params[:id])
    @settings = Setting.find(@gallery.current_setting_id)
    @images = Image.where(gallery_id: @gallery.id).order(:id)
    @gallery_owner = User.find(@gallery.user_id)
  end




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
