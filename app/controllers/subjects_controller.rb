class SubjectsController < ApplicationController
before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all.order(:name)
  end

  def show
  #  @subject = Subject.find(params[:id])
  end

  def edit
  #  @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] = "Subject has been created."
      redirect_to @subject
    else
      flash.now[:alert] = "Subject has not been created."
      render "new"
    end
  end

  def update
  #  @subject = Subject.find(params[:id])

    if @subject.update(subject_params)
      flash[:notice] = "Subject has been updated."
      redirect_to @subject
    else
      flash.now[:alert] = "Subject has not been updated."
      render "edit"
    end
  end

  def destroy
  #  @subject = Subject.find(params[:id])
    @subject.destroy

    flash[:notice] = "Subject has been deleted."
    redirect_to subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The subject you were looking for could not be found."
    redirect_to subjects_path
  end

end
