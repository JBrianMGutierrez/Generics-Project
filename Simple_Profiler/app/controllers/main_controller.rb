class MainController < ApplicationController
  def home

  end

  def list_of_users
    @profile = Profile.all.paginate(:page => params[:page], :per_page => 15)
    @user = User.all.paginate(:page => params[:page], :per_page => 15)
  end

  def admin
    @user = User.find(params[:id])
    @user.toggle_admin!
    redirect_to accounts_path
  end

  def approved
    @approved = User.find(params[:id])
    @approved.toggle_approved!
    redirect_to accounts_path
  end
end
