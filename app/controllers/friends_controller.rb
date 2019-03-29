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
    # check if Friend currently exists for logged-in User
    check_current_friends = Friend.where(owner_user_id: session[:user_id])
    already_friends = false
    check_current_friends.each do |friend|
      if friend.target_user_id == params[:format]
        already_friends = true
      end
    end

    if already_friends
      flash[:message] = "This User is already your Friend!"
      redirect_to user_path(User.find(params[:format]))

    # prevent logged-in User from Friend-ing themself!!
    elsif session[:user_id] == params[:format]
      flash[:message] = "You cannot add yourself to your Friends!"
      redirect_to user_path(User.find(params[:format]))

    # if no Friend match currently exists, create new one
    else
      @friend = Friend.new(owner_user_id: session[:user_id], target_user_id: params[:format])
      if @friend.save
        redirect_to new_friend_confirmation_path
      else
        flash[:message] = "Something went wrong with adding Friend."
        redirect_to root_path
      end
    end

  end

  def new_friend_confirmation
    friend = Friend.where(owner_user_id: current_user.id).last
    @target_user = User.find(friend.target_user_id)
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
    @friend = Friend.find_by(target_user_id: params[:id])
    @friend.destroy
    redirect_to user_path(current_user)
  end

  private

  def friend_params
    params.require(:friend).permit!
  end

end
