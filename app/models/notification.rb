class Notification < ActiveRecord::Base

  after_create :notify

  validates :sender_name, :message,
            presence: true

  validates :sender_email,
            presence: true,
            format: {with: /@/ }

  def mailer
    NotificationMailer
  end
  def notify
    mailer.visitor_email(self).deliver
    mailer.admin_email(self).deliver
  end
end
