class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform notification, recipient_id
    ActionCable.server.broadcast "notification_channel_#{recipient_id}",
      notification: render_notification(notification)
  end

  private

  def render_notification notification
    ApplicationController.renderer.render(partial: "notifications/notification",
      locals: {notification: notification})
  end
end
