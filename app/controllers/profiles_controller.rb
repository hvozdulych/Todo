class ProfilesController < ApplicationController
  def show
    @user = current_user
    @profile = @user.profile
    puts @profile.inspect
  end

  def edit
    @user = current_user
    @profile = @user.profile
  end

  def update
    @user = current_user
    @profile = @user.profile

    if @profile.update_attributes(profile_params)
      redirect_to user_profile_path
    end
  end

  private

    def profile_params
      params.require(:profile).permit(:name, :surname, :age, :genre)
    end
end
