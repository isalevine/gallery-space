class SettingsController < ApplicationController
  def index
    @settings = Setting.where(gallery_id: params[:gallery_id])
  end

  def show
    @setting = Setting.find(params[:id])

  end

  def new
    @setting = Setting.new
    # instance variables below were moved to the Setting-New
    # view--see comment in that file for further explanation
    # @background_colors = ['black', 'white', 'red', 'blue', 'green']
    # @font = ['Arial', 'Helvetica', 'Times New Roman', 'Courier New', 'Courier', 'Verdana']
  end

  def create
    if !Setting.exists?(gallery_id: params[:gallery_id], theme_name: setting_params[:theme_name])
      @setting = Setting.new(setting_params)
      if @setting.save
        @gallery = Gallery.find(params[:gallery_id])
        @gallery.current_setting_id = @setting.id
        @gallery.save
        redirect_to user_gallery_setting_path(current_user.id, params[:gallery_id], @setting)
      else
        flash[:message] = @setting.errors.full_messages.to_sentence
        redirect_to new_user_gallery_setting_path(current_user.id, params[:gallery_id])
      end
    else
      flash[:message] = "This Gallery already has a Settings with that name!"
      redirect_to new_user_gallery_setting_path(current_user.id, params[:gallery_id])
    end
  end

  def edit
    @setting = Setting.find(params[:id])
    @background_colors = ['black', 'white', 'red', 'blue', 'green']
    @font = ['Arial', 'Helvetica', 'Times New Roman', 'Courier New', 'Courier', 'Verdana']
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.save
      @setting.update(setting_params)
      redirect_to user_gallery_setting_path(current_user.id, params[:gallery_id], @setting)
    else
      render :new
    end
  end

  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy
    redirect_to user_gallery_settings_path(current_user.id, params[:gallery_id])
  end



  around_action :catch_not_found

  private


  def setting_params
    params.require(:setting).permit!
  end

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    flash[:message] = "Setting not found - redirected to gallery page."
    redirect_to user_gallery_path(current_user.id, params[:gallery_id])
  end


end
