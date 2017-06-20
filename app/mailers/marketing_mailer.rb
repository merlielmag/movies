class MarketingMailer < ActionMailer::Base

  default_url_options[:protocol] = 'http'
  default :from => "support@merliapps.com"
  default :content_type => "text/html"

def onboarding_mailer(user)

  @user = user
  @email = user.email

  I18n.with_locale(@user.locale) do
    mail from: I18n.t('mailer.maria'),
    to: @email,
    bcc: "youthcandoit@kolau.com"
    subject: I18n.t('mailer.el_titulo_html', first_name: @user.first_name)
  end
end

def onboarding_mailer_second_mailer
end

def onboarding_mailer_third_mailer
end
