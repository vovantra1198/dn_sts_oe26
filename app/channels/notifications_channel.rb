class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel_#{params[:recipient_id]}"
  end

  def unsubscribed; end
end
