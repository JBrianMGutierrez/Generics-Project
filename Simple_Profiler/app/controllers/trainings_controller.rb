class TrainingsController < ApplicationController
  def show
    @training = Training.find(params[:id])
  end

  def new
    @training = current_user.profile.training.build
  end

  def create
    @training = current_user.profile.training.build(training_params)
    if @training.save
      flash[:success] = "You successfully created a training information!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    if @training.update_attributes(training_params)
      flash[:success] = 'Training information updated'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to root_path
  end

  private

  def training_params
    params.require(:training).permit(:certificate, :remove_certificate, :speaker,
                                    :date_of_training, :type_of_training, :price, :training_description )
  end
end
