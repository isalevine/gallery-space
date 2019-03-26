class UsersController < ApplicationController

  def index
    @users = User.all
  end

  # visitor show page
  def show
    @user = User.find(params[:id])
  end

  # show your own profile, once logged in
  def show_your_profile
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      # flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      # flash[:error] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect to user_deleted_path
  end

  # def user_deleted
  #   (see FriendlyCharacterGenerator code)
  # end



  around_action :catch_not_found

  private



  def user_params
    params.require(:user).permit!
  end

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to users_path, :flash => { :error => "Record not found." }
  end

end
