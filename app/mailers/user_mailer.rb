class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    mail(:to => "#{@user.name} <#{user.email}>", :subject => "Welcome to Ativa | MakerSquare")
  end

  def admin_confirmation(potential_admin)

    @generated_number = potential_admin.generated_number

    mail to: potential_admin.email, subject: "Ativa Admin?!"
    
  end
end
