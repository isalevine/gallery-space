class SettingsController < ApplicationController
  def index
    @settings = Setting.all
  end

  def show
    @setting = Setting.find(params[:id])
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to setting_path(@setting)
  else
    render :new
  end
  end

  def edit
    @setting = Setting.find(params[:id])
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

  # def destroy
  #   @setting
  # end

  private

  def setting_params
    params.require(:setting).permit!
  end

end
