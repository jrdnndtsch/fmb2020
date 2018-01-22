module Api
  module V1
    class ReportsController < Api::BaseController

    	require 'json'


      def generate_report
        email = params[:email]
        @report = Report.create!(email: email)
        items = JSON.parse(params[:items])

        items.each do |item|
          puts item
        end

        
        # create an instance of ActionView, so we can use the render method outside of a controller
        av = ActionView::Base.new()
        av.view_paths = ActionController::Base.view_paths

        # need these in case your view constructs any links or references any helper methods.
        av.class_eval do
          include Rails.application.routes.url_helpers
          include ApplicationHelper
        end

        puts '>>>>>>>>>>>>render template'
        pdf_html = av.render template: 'api/v1/reports/generate_report', layout: 'layouts/pdf', locals: {report: @report, items: items }

        puts '>>>>>>>>>>>>create pdf'
        # use wicked_pdf gem to create PDF from the doc HTML
        doc_pdf = WickedPdf.new.pdf_from_string(
          pdf_html,
          page_size: 'Letter',
          javascript_delay: 100
        )

        puts '>>>>>>>>>>>>>>>save to disk'
        # save PDF to disk
        pdf_path = Rails.root.join('tmp', "#{@report.id}_#{Date.today.iso8601}.pdf")
        File.open(pdf_path, 'wb') do |file|
          puts ">>>>>>>>>>>>>>>>>>#{file}"
          file << doc_pdf
        end

        puts '>>>>>>>>>>>>>>>>>open and save to report'
        @report.pdf = File.open pdf_path
        @report.save!

        puts '>>>>>>>>>>>>>>>>>delete temp file'
        # The report has now been saved elsewhere using Paperclip; we don't need to store it locally
        File.delete(pdf_path) if File.exist?(pdf_path)
        render json: @report.pdf.url.to_json

        puts '>>>>>>>>>>>>>>>>>email report'
        # email the report
        ReportPdfMailer.send_mail(@report.id).deliver

    	end

    end
  end
end