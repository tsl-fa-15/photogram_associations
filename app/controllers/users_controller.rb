class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.image_url = params[:image_url]

    if @user.save
      redirect_to users_url, :notice => "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.name = params[:name]
    @user.email = params[:email]
    @user.image_url = params[:image_url]

    if @user.save
      redirect_to user_url(@user.id), :notice => "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to users_url, :notice => "User deleted."
  end
end
