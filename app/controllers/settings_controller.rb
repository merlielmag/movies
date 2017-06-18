class SettingsController < ApplicationController

  before_action :authenticate_user!

  layout "admin"

  def index
    @user = current_user
    @setting = current_user.setting
  end

  def show
    @setting = Setting.find(params[:id])
  end

  def new
    @setting = current_user.build_setting
  end


  def create
    @setting = current_user.build_setting(setting_params)

    if @setting.save
      flash[:success] = t('flash.exito')
    	redirect_to settings_path
    else
    	render :new
    end
  end


  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])

    if @setting.update_attributes(setting_params)
      flash[:success] = t('flash.exito')
     	redirect_to settings_path
    else
      render :edit
    end
  end

  private
  def setting_params
    params.require(:setting).permit(:country, :language)
  end

end
