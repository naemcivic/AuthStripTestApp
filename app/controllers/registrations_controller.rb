class RegistrationsController < Devise::RegistrationsController
  # This controller overides Devise's defualt controller, it is defined in the routes
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
