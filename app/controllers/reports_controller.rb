class ReportsController < ApplicationController
  def index
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
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

  private

  def report_params
    params.require(:report).permit(:name, :comment)
  end

end
