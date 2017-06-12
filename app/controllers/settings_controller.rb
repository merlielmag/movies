class SettingsController < ApplicationController

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
     	redirect_to settings_path
    else
      render :index
    end
  end


  private
  def setting_params
    params.require(:setting).permit(:country, :language)
  end

end
