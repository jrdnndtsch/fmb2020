module Api
  module V1
    class CustomersController < Api::BaseController
    	#webhook request from Shopify will not be sent with API keys so skip this validation
    	skip_before_action :authenticate_user_from_token!
    	
    	def create
    		if check_webhook
    			puts 'NEW CUSTOMER HAS BEEN MADE <<<<<<<<<<<<<<<<<<<<'
    			puts "response #{params[:first_name]} #{params[:last_name]} #{params[:email]}"
    			NewCustomerMailer.fbm_notification(params[:first_name], params[:last_name], params[:email]).deliver
    		end 

    	end
    	def check_webhook
    		request.body.rewind
    		data = request.body.read
    		verified = helpers.verify_webhook(data, env["HTTP_X_SHOPIFY_HMAC_SHA256"])
    		return verified
    	end
    end
  end
end    	