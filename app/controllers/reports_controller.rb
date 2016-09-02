class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
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
    @report = Report.find(params[:id])

    if @report.update(report_params)
      flash[:notice] = "Report has been updated."
      redirect_to @report
    else
      flash.now[:alert] = "Report has not been updated."
      render "edit"
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    flash[:notice] = "Report has been deleted."
    redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:name, :comment)
  end

end
