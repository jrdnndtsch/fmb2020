module ApplicationHelper
	def verify_webhook(data, hmac_header)
		calculated_hmac = Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', ENV['webhook_key'], data))
		ActiveSupport::SecurityUtils.secure_compare(calculated_hmac, hmac_header)
	end
end
