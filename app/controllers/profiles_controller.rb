class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
  end

  def edit
    @user = current_user
    @profile = @user.profile
  end

  def update
    @user = current_user

    if @user.profile.update_attributes(profile_params)
      redirect_to user_profile_path
    end
  end

  private

    def profile_params
      params.require(:profile).permit(:name, :surname, :age, :genre)
    end
end
