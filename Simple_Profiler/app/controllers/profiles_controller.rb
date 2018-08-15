class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
    @profile = Profile.all
  end

  def show
    @datetime = DateTime.now
    @user = User.find(params[:id])
    @profile = @user.profile
    @training = @profile.training.paginate(:page => params[:page], :per_page => 5)
    @accomplishment = @profile.accomplishment.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "You successfully created a profile!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def user_page
    @user = current_user
    if !@user.profile.nil?
      @datetime = DateTime.now
      @profile = @user.profile
      @training = @profile.training.paginate(:page => params[:page], :per_page => 5)
      @accomplishment = @profile.accomplishment.paginate(:page => params[:page], :per_page => 15)
    else
      redirect_to new_profile_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:profile_picture, :remove_profile_picture, :date_of_birth,
                                    :civil_status, :gender, :contact_number,
                                    :education, :biography, :location_city, :main_skill,
                                    :main_hobby, :education_status, :interest)
  end
end
