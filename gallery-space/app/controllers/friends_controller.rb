class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
    @user = User.find(@friend.owner_user_id)
    @user_friend = User.find(@friend.target_user_id)
  end

  def new
    @user = User.find(params[:user_id])
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      redirect_to user_friend_path(friend_params[:owner_user_id], @friend)
    else
      render :new
    end
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    if @friend.update(friend_params)
      redirect_to user_friend_path(friend_params[:owner_user_id], @friend)
    else
      render :new
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    redirect to user_deleted_path
  end

  private

  def friend_params
    params.require(:friend).permit!
  end

end
