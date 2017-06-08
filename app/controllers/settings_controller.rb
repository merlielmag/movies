class SettingsController < ApplicationController

  def index
    @user = current_user
    @setting = Setting.find_by_user_id(@user)
  end

  def show
    @setting = Setting.find(@user)
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(settings_params)

    if @setting.save
      redirect_to settings_path, notice: "Se ha guardado los datos!!"
    else
      render :new
    end
  end

  def edit
    @setting = Setting.find_by_user_id(@user)
  end

  def update
    @setting = Setting.find(params[:id])

    if @setting.update_attributes(settings_params)
      redirect_to settings_path, notice: "èxit!"
    else
      render :edit
    end
  end


  private

  def settings_params
    params.require(:setting).permit(:language, :country)
  end

end
