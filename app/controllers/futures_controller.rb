class FuturesController < ApplicationController
  before_action :set_subject
  before_action :set_future, only: [:show, :edit, :update, :destroy]

  def new
    @future = @subject.futures.build
  end

  def show
    # handled by before action call to set future
  end


def create
  @future = @subject.futures.build(future_params)

  if @future.save
    flash[:notice] = "Future has been created."
    redirect_to [@subject, @future]
  else
    flash.now[:alert] = "Future has not been created."
    render "new"
  end
end


private
  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def set_future
    @future = @subject.futures.find(params[:id])
  end

  def future_params
    params.require(:future).permit(:title, :content)
  end


end
