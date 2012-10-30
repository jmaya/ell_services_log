class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
  end

  def download
    report = Report.find(params[:id])
    send_data(report.run, :type => 'text/csv; charset=utf-8; header=present', :filename => "report.csv") 
  end

end
