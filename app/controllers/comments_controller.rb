class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = @post.comments.order("created_at ASC")

    respond_to do |format|
      format.html { render :layout => false } #We're requesting that the application's layout view is only
      # rendered as part of this request, if the request isn't made with AJAX.
      # Simply put, we won't get the added layout html returned during an AJAX call,
      # which is great news, we only want the extra comments from this index after all, not an extra navbar
    end
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      create_notification @post, @comment
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.delete
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def create_notification post, comment
    return if post.user.id == current_user.id
    Notification.create(user_id: post.user.id,
                        notified_by_id: current_user.id,
                        post_id: post.id,
                        comment_id: comment.id,
                        notice_type: 'comment')
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
