class SettingsController < ApplicationController
  def index
    @settings = Setting.all
  end

  def show
    @setting = Setting.find(params[:id])

  end

  def new
    @setting = Setting.new
    @background_colors = ['black', 'white', 'red', 'blue', 'green']
    @font = ['Arial', 'Helvetica', 'Times New Roman', 'Courier New', 'Courier', 'Verdana']
  end

  def create
    @setting = Setting.new(setting_params)
    # byebug
    if @setting.save
      redirect_to setting_path(@setting)
  else
    render :new
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
    redirect_to setting_path(@setting)
  else
    render :new
  end
  end

  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy
    redirect to user_deleted_path
  end

  private

  def setting_params
    params.require(:setting).permit!
  end

end
