class RegistrationsController < Devise::RegistrationsController 

  private

  def sign_up_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

end