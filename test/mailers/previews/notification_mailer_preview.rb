# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  def visitor_email
    notification = Notification.create(sender_name: "Mr Dubois", sender_email: "dubois@gmail.com", message: "POuvez vous me recontacter asap au 01 30 56 18 63 ?")
    NotificationMailer.visitor_email(notification)
  end
  def admin_email
    notification = Notification.create(sender_name: "Mr Dubois", sender_email: "dubois@gmail.com", message: "POuvez vous me recontacter asap au 01 30 56 18 63 ?")
    NotificationMailer.admin_email(notification)
  end
end
