class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      redirect_to friend_path(@friend)
    else
      render :new
  end
end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    if @friend.save
    @friend.update(friend_params)
    redirect_to friend_path(@friend)
  else
    render :new
  end
end

  # def destroy
  #   @friend.find(params[:id]).destroy
  # end

  private

  def friend_params
    params.require(:friend).permit!
  end
end
