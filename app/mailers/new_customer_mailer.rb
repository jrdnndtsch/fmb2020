class NewCustomerMailer < ApplicationMailer
	def fbm_notification(first_name, last_name, email)
			@first_name = first_name
			@last_name = last_name
			@email = email
	    mail(
	      to: 'info@canadafbm2020.com',
	      subject: "Catalogue Sign Up #{Date.today.iso8601}",
	    )
	  end
end
