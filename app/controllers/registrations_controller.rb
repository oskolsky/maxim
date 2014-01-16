class RegistrationsController < Devise::RegistrationsController

  def update
    @user = current_user
    if change_password?
      @user.update_attributes(user_params) ? sign_in(@user, bypass: true) : clean_up_passwords(@user)
    else
      @user.update_without_password(user_params) ? sign_in(@user) : clean_up_passwords(@user)
    end
    render :edit
  end

  def change_password
    self.resource = current_user
  end

  protected

  def change_password?
    params[:user][:password].present? || params[:user][:password_confirmation].present? || params[:user][:current_password].present?
  end

  def user_params
    if change_password?
      params.require(:user).permit(:password, :password_confirmation)
    else
      params.require(:user).permit(:name, :nickname, :email)
    end
  end

end