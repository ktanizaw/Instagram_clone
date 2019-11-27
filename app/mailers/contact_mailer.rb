class ContactMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def contact_mail(contact)
    @contact = contact

    mail to: "@users.email", subject: "お問い合わせの確認メール"
end
end
