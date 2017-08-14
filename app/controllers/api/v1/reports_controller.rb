module Api
  module V1
    class ReportsController < Api::BaseController

    	require 'json'

    	def generate_report
  			@report = Report.first
  			items = JSON.parse(params[:items])
		    GenerateReportPdfJob.perform_now(report_id: @report.id, items: items)
		    render json: @report.pdf.url.to_json
    	end

    end
  end
end