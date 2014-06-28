class NotificationsController < ApplicationController

  def create
    @notification = Notification.create notification_params
    if @notification.save
      @notification = Notification.new
      flash.now[:notice] = "Votre message a bien été délivré a nos équipes commerciales."
    end
    render partial: "form"
  end

  def notification_params
    params.require(:notification).permit(:sender_email, :sender_name, :message)
  end
end
