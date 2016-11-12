class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :owned_post, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order('created_at DESC').page params[:page]
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    flash[:success] = "Post deleted."
    redirect_to posts_url
  end

  def like
    if @post.liked_by current_user
      create_notification @post, 'lik'
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def unlike
    if @post.unliked_by current_user
      create_notification @post, 'unlik'
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

  def create_notification post, type
    return if post.user.id == current_user.id
    Notification.create(user_id: post.user.id,
                        notified_by_id: current_user.id,
                        post_id: post.id,
                        comment_id: post.id,
                        notice_type: type)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :image, :caption)
    end

    def owned_post
      unless current_user == @post.user
        flash[:alert] = "That post doesn't belong to you!"
        redirect_to root_path
      end
    end
end
