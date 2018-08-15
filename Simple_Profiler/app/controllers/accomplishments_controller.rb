class AccomplishmentsController < ApplicationController
  def show
    @accomplishment = Accomplishment.find(params[:id])
    @pictures = @accomplishment.pictures
  end

  def new
    @accomplishment = current_user.profile.accomplishment.build
    @accomplishment.pictures.build
  end

  def create
    @accomplishment = current_user.profile.accomplishment.build(accomplishment_params)
    if @accomplishment.save
      params[:pictures]['award_picture'].each do |a|
        @picture = @accomplishment.pictures.create!(:award_picture => a,
                                                   :accomplishment_id => @accomplishment.id)
      end
      flash[:success] = 'You successfully created a Award information!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @accomplishment = Accomplishment.find(params[:id])
  end

  def update
    @accomplishment = Accomplishment.find(params[:id])
    if @accomplishment.update_attributes(accomplishment_params)
      flash[:success] = 'Training information updated'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def accomplishment_params
    params.require(:accomplishment).permit(:title, :type_of_award, :date_of_award,
                                           :award_description,
                                           pictures_attributes: [:id, :accomplishment_id, :award_picture])
  end
end
