class ReportsController < ApplicationController
  before_action :authenticate_user!

  def show
    @reports = Report.find(params[:id])
    @pictures = @reports.photos
  end

  def new
    @reports = current_user.reports.build
    @reports.photos.build
  end

  def create
    @reports = current_user.reports.build(report_params)
    if @reports.save
      params[:photos]['picture'].each do |a|
        @reports_picture = @reports.photos.create!(:picture => a, :report_id => @reports.id)
      end
      flash[:success] = 'Report Created'
      redirect_to root_url
    else
      @reports.photos.build
      render 'new'
    end
  end

  def edit
    @reports = Report.find(params[:id])
    @reports_picture = @reports.photos
  end

  def update
    @reports = Report.find(params[:id])
    if @reports.update_attributes(report_params)
      flash[:success] = 'Report Created'
      redirect_to report_path(@reports)
    else
      render 'edit'
    end
  end

  def destroy
    Report.find(params[:id]).destroy
    flash[:success] = "Report deleted"
    redirect_to root_path
  end

  def destroy_picture
    Photo.find(params[:id]).remove_picture!
    redirect_to root_path
  end

  private

  def report_params
    params.require(:report).permit(:report_title, :report_date,
                                   :report_location, :report_description,
                                   photos_attributes: [:id, :report_id, :picture])
  end
end
