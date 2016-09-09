class UnitsController < ApplicationController
  before_action :set_subject
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  def new
    @unit = @subject.units.build
  end

  def show
    # via before_action :set_unit
  end

  def edit
    # via before_action :set_unit
  end

  def create
    @unit = @subject.units.build(unit_params)

    if @unit.save
      flash[:notice] = "Unit has been created."
      redirect_to [@subject, @unit]
    else
      flash.now[:alert] = "Unit has not been created."
      render "new"
    end
  end

  def update
    if @unit.update(unit_params)
      flash[:notice] = "Unit has been updated."
      redirect_to [@subject, @unit]
    else
      flash.now[:alert] = "Unit has not been updated."
      render "edit"
    end
  end

private

  def unit_params
    params.require(:unit).permit(:title, :content)
  end

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def set_unit
    @unit = @subject.units.find(params[:id])
  end

end
