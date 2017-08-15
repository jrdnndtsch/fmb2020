class ReportPdfMailer < ApplicationMailer

	def send_mail(report_id )
			puts '>>>>>>>>>>>>>>>>>>>>in send mail'
	    @report = Report.find(report_id)

	    # ApplicationJob::GeneratePdfJob.perform_now(report_id: @report.id)
	    # @report.reload

	    attachments["report_#{Date.today.iso8601}.pdf"] = {
	      mime_type: 'application/pdf',
	      content: open(@report.pdf.expiring_url).read
	    }

	    mail(
	      to: @report.email,
	      subject: "FBM Book Catalogue #{Date.today.iso8601}",
	    )
	  end

end
