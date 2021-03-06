class PhotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :check_if_owner, only: [:edit, :update, :destroy]

  def show
    @photo = Photo.find(params['id'])
  end

  def new
    @photo = Photo.new
    @users = User.all
  end

  def create
    @photo = Photo.new
    @photo.caption = params['the_caption']
    @photo.source = params['the_source']
    @photo.user_id = params['user_id']
    @users = User.all

    if @photo.save
      redirect_to photo_url(@photo.id)
    else
      render 'new'
    end

  end

  def destroy
    @photo = Photo.find(params['id'])
    @photo.destroy

    redirect_to photos_url
  end

  def edit
    @photo = Photo.find(params['id'])
    @users = User.all
  end

  def update
    @photo = Photo.find(params['id'])
    @photo.caption = params['the_caption']
    @photo.source = params['the_source']
    @photo.user_id = params['user_id']
    @users = User.all

    if @photo.save
      redirect_to photo_url(@photo.id)
    else
      render 'edit'
    end

  end

  def index
    @photos = Photo.all
    @comment = Comment.new
  end

  def check_if_owner
    @photo = Photo.find(params[:id])
    if current_user.id != @photo.user_id
      redirect_to photos_url, notice: "You must be the owner to do that"
    end
  end
end





