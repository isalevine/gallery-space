class UsersController < ApplicationController
  skip_before_action :authenticate_user, except: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  # visitor show page
  def show
    # do NOT use helper method 'current_user' here--
    # any site visitor can see this view!!
    # (DON'T change any @user objects to current_user
    # in the 'show.erb' view either!!!)
    @user = User.find(params[:id])
  end

  # show your own profile, once ~~logged in~~
  # REFACTOR WITH session[:user_id] !!!
  def show_your_profile
    # current_user is a helper method available in
    # the view (no @user object needed)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # @user is now accessible through helper method
      # in application_controller.rb, 'current_user'
      redirect_to current_user
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    # current_user is a helper method available in
    # the view (no @user object needed)
  end

  def update
    # current_user is a helper method available in
    # the view (no @user object needed)
    if current_user.update(user_params)
      redirect_to current_user
    else
      flash[:error] = current_user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    # current_user is a helper method available in
    # the view (no @user object needed)
    current_user.destroy
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
    flash[:message] = "User not found - redirected to main page."
    redirect_to root_path
  end

end
