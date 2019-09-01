class Notification < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true
  validates :recipient_id, presence: true

  after_save do
    NotificationBroadcastJob.perform_later(self, Notification.last.recipient_id)
  end

  scope :notification_list, ->(ids){where(recipient_id: ids)}
  scope :order_by, ->{order(created_at: :desc)}
end
