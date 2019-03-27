class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
    # current_user is a helper method available in
    # the view (no @user object needed)
    @user_friend = User.find(@friend.target_user_id)
  end

  def new
    # current_user is a helper method available in
    # the view (no @user object needed)
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

  # DO WE ONLY NEED CREATE/DESTROY functions for Friends???

  # def edit
  #   @friend = Friend.find(params[:id])
  # end
  #
  # def update
  #   @friend = Friend.find(params[:id])
  #   if @friend.update(friend_params)
  #     redirect_to user_friend_path(friend_params[:owner_user_id], @friend)
  #   else
  #     render :new
  #   end
  # end

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
