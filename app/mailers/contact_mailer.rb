class ContactMailer < ApplicationMailer
  default to: "送信先メアド"
  default from: "送信元メアド"

  def received_email(contact)
    @contact = contact
    mail(:subject => 'ユーザーに配信されるメールのタイトル')
  end
end
