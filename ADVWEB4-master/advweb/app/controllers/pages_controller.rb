class PagesController < ApplicationController
  def home
    @reports = Report.all.paginate(page: params[:page], per_page: 5)
  end

  def user_profile
    @user = current_user.reports.paginate(page: params[:page], per_page: 5)
  end

  def list_of_accounts
    if params[:approved] == 'false'
      @user = User.where(approved: false).paginate(page: params[:page], per_page: 5)
    else
      @user = User.all.paginate(page: params[:page], per_page: 5)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy
      redirect_to list_path
    end
  end

  def admin
    @user = User.find(params[:id])
    if @user.update_attribute(:is_admin, true)
      flash[:success] = 'Change Successfully'
      redirect_to list_path
    end
  end

  def approved
    @user = User.find(params[:id])
    if @user.update_attribute(:approved, true)
      flash[:success] = 'User Approved'
      redirect_to list_path
    end
  end
end
