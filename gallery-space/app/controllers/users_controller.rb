class UsersController < ApplicationController
  skip_before_action :authenticate_user, except: [:edit, :update, :destroy]

  def index
    @users = User.order("LOWER(users.user_name) ASC").references(:users)
  end

  # visitor show page
  def show
    if params[:id] == session[:user_id].to_s
      render :show_your_profile
    else
      @user = User.find(params[:id])
    end
  end

  # show your own profile
  def show_your_profile
    if params[:id] != session[:user_id].to_s
      redirect_to user_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to current_user
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to current_user
    else
      flash[:error] = current_user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to user_deleted_path
  end

  def user_deleted
  end


  def seed_create=(user_params)
    @user = User.create(user_params)
  end



  around_action :catch_not_found

  private



  def user_params
    params.require(:user).permit!
  end

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    flash[:message] = "User not found - redirected to main page."
    redirect_to root_path
  end

end
