class NotificationsController < ApplicationController
  def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
    redirect_to post_path @notification.post
  end

  def index
    @notifications = current_user.notifications.order('created_at DESC')
  end

  def mark_as_read
    @notification = Notification.find(params[:id])
    @notification.update read: true
    respond_to do |format|
      format.js
    end
  end

  def mark_as_unread
    @notification = Notification.find(params[:id])
    @notification.update read: false
    respond_to do |format|
      format.js
    end
  end

end
