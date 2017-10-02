class UsersController < ApplicationController
  before_action :authenticate_user!
  # after_action :verify_authorized
  before_action :admin_only, only: [:index]

  def admin_only
    unless current_user.role == "admin"
      redirect_to user_path(current_user), alert: "Access denied."
    end
  end

  def index
    @users = User.all
    # authorize User
  end

  def show
    @user = User.find(params[:id])
    # authorize @user
  end

  def update
    @user = User.find(params[:id])
    # authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    # authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
