class Admin::UsersController < Admin::BaseController
  skip_before_action :require_login
  skip_before_action :check_admin
  before_action :set_user, only: %i[edit update show destroy]

  def index
    @users = User.all
  end

  def edit; end

  def show; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, success: 'Update successful.'
    else
      flash.now['danger'] = 'Update faild.'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :role, :avatar, :avatar_cache)
  end
end
