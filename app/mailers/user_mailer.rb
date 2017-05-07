class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    @url = "http://market-portal.herokuapp.com/users/#{user.activation_token}/activate"
    mail(:to => user.email,
         :subject => "ようこそ、makepoへ")
  end

  def activation_success_email(user)
    @user = user
    @url = "http://market-portal.herokuapp.com/login"
    mail(:to =>user.email,
         :subject =>"ログインが完了しました")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  #def activation_needed_email
  #  @greeting = "Hi"

  #  mail to: "to@example.org"
  #end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  #def activation_success_email
  #  @greeting = "Hi"
  #
  #  mail to: "to@example.org"
  #end
end
