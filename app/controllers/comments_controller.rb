class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :check_if_owner]
  before_action :check_if_owner, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.user_id = params[:user_id]
    @comment.photo_id = params[:photo_id]
    @comment.contents = params[:contents]

    if @comment.save
      respond_to do |format|
        format.html {redirect_to photos_url, :notice => "Comment created successfully."}
        format.js {render 'create'}

      end
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    @comment.user_id = params[:user_id]
    @comment.photo_id = params[:photo_id]
    @comment.contents = params[:contents]

    if @comment.save
      redirect_to comment_url(@comment.id), :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @comment.destroy

    redirect_to comments_url, :notice => "Comment deleted."
  end

  def check_if_owner
    if current_user.id != @comment.user_id
      redirect_to root_url, notice: "You must be the owner to do that"
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
