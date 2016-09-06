class SubjectsController < ApplicationController

  def index
  end

  def show
    @subject = Subject.find(params[:id])
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
      # nothing, yet
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

end
