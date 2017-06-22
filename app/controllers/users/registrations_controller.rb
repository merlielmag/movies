class Users::RegistrationsController < Devise::RegistrationsController

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @user = current_user
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    super
    if @user.persisted?
      Marketing::OnboardingMailer.perform_now(@user)
    end
  end

  def  perform(user=nil)
    unless user.is_a?(Array)
      if user.is_a?(User)
        user = [user]
      else
        # user = User.where('canceled IS NOT TRUE and active IS TRUE')
        user = User.all
      end
    end
    user.each do |user|
      begin
        if user.created_at < 1.hour.ago
          if user.marketing_mailer.blank?
            user.marketing_mailer = 1
            user.marketing_mailer_date = Date.today
            user.save
            MarketingMailer.onboarding_mailer(user).deliver_now
          elsif user.marketing_mailer == 1 && user.marketing_mailer_date > 2.days.ago
            user.marketing_mailer = 1
            user.marketing_mailer_date = Date.today
            user.save
            MarketingMailer.onboarding_mailer_second_mailer(user).deliver_now
          elsif user.marketing_mailer == 1 && user.marketing_mailer_date > 4.days.ago
            user.marketing_mailer = 1
            user.marketing_mailer_date = Date.today
            user.save
            MarketingMailer.onboarding_mailer_third_mailer(user).deliver_now
          end
        end
      rescue => e
        message = "user-#{user.id} \n\t#{e.message}\n\n \t#{e.backtrace.join("\n\t")}"
        LogManager.create(:user=>user.id,:exception_message=>message,:tag=>"MailerError")
      end
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    settings_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
