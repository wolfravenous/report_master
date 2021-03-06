class IntrosController < ApplicationController
  before_action :set_subject
  before_action :set_intro, only: [:show, :edit, :update, :destroy]

  def new
    @intro = @subject.intros.build
  end

  def show
    # via before_action :set_intro
  end

  def edit
    # via before_action :set_intro
  end

  def create
    @intro = @subject.intros.build(intro_params)
    if @intro.save
      flash[:notice] = "Intro has been created."
      redirect_to [@subject, @intro]
    else
      flash.now[:alert] = "Intro has not been created."
      render "new"
    end
  end

  def update
    if @intro.update(intro_params)
      flash[:notice] = "Intro has been updated."
      redirect_to [@subject, @intro]
    else
      flash.now[:alert] = "Intro has not been updated."
      render "edit"
    end
  end

  def destroy
    @intro.destroy
    flash[:notice] = "Intro has been deleted."

    redirect_to @subject
  end

  private

  def intro_params
            params.require(:intro).permit(:title, :content)
  end

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def set_intro
    @intro = @subject.intros.find(params[:id])
  end

end
