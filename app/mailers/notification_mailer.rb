class NotificationMailer < ActionMailer::Base

  include Roadie::Rails::Automatic

  default from: "contact@connectic-it.com"
  layout 'email'

  def mail_with_logo args = {}, &block
    attachments.inline['logo.png'] = File.read Rails.root.join("app", "assets", "images", "logo.png")
    mail_without_logo args, &block
  end

  alias_method_chain :mail, :logo

  def visitor_email(notification)
    @notification = notification
    mail to: @notification.sender_email, subject: "Accusé de reception"
  end

  def admin_email(notification)
    @notification = notification
    mail to: Admin.all.map(&:email), subject: "Un message vous a été posté depuis le site web"
  end

end
