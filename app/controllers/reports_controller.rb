class ReportsController < ApplicationController
  # Removes the need for setting the @report variable in show,edit,update,destroy actions
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def index
    @reports = Report.all
  end

  def show
    # @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def edit
    # @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)

    if @report.save
      flash[:notice] = "Report has been created."
      redirect_to @report
    else
      flash.now[:alert] = "Report has not been created."
      render "new"
    end
  end

  def update
    # @report = Report.find(params[:id])

    if @report.update(report_params)
      flash[:notice] = "Report has been updated."
      redirect_to @report
    else
      flash.now[:alert] = "Report has not been updated."
      render "edit"
    end
  end

  def destroy
    # @report = Report.find(params[:id])
    @report.destroy

    flash[:notice] = "Report has been deleted."
    redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:name, :comment, :gender, :subject_id, :classwork, :assessment, :participate, :average)
  end

  def set_report
    @report = Report.find(params[:id])
    rescue ActiveRecord::RecordNotFound

    flash[:alert] = "The report you were looking for could not be found."
    redirect_to reports_path
  end
end
