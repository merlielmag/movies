class Marketing::OnboardingMailer < ApplicationJob
  queue_as :default
  def  perform(user=nil)
    unless user.is_a?(Array)
      if user.is_a?(User)
        user = [user]
      else
        user = User.where('canceled IS NOT TRUE and active IS TRUE')
      end
    end
    user.each do |user|
      MarketingMailer.onboarding_mailer(user).deliver_now
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
end
