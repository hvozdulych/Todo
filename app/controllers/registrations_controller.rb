class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.profile = Profile.new
    respond_with self.resource
  end
 
  private

  def sign_up_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation, profile_attributes: [:name, :surname, :age])
  end

  def account_update_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation)
  end
end