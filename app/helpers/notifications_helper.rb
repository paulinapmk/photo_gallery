module NotificationsHelper
  def marked_notification(notification)
    if notification.read
      return link_to '', mark_as_unread_path(notification.id), remote: true, id: "mark_as_unread_#{notification.id}",
              title: 'Mark as unread',
              class: "glyphicon glyphicon-flag mark-as-read"

    else
      return link_to '', mark_as_read_path(notification.id), remote: true, id: "mark_as_read_#{notification.id}",
              title: 'Mark as read',
              class: "glyphicon glyphicon-ok mark-as-read"
    end
  end

  def set_notification_title(notification)
    return 'Mark as unread' if notification.read

  end

  def count_notifications
    current_user.notifications.where(read: false).count
  end
end
