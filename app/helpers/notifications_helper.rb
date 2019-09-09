module NotificationsHelper
  def create_notify title, url, recipient_id
    @notify = Notification.new(title: title, url: url,
                                recipient_id: recipient_id)
    puts @notify.errors.full_messages.join(", ") unless @notify.save
  end

  def get_notification
    @notification = Notification.notification_list(get_sub_user).order_by
  end
end
