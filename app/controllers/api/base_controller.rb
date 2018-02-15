class Api::BaseController < ActionController::Base
  acts_as_token_authentication_handler_for User
  before_filter :cors_set_access_control_headers
  # before_filter :cors_preflight_check
  # after_filter :cors_set_access_control_headers
  
  private
    def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
      headers['Access-Control-Max-Age'] = "1728000"
    end

    # def cors_preflight_check
    # 	put 'pre flight'
    #   if request.method == 'OPTIONS'
    #     headers['Access-Control-Allow-Origin'] = '*'
    #     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #     headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
    #     headers['Access-Control-Max-Age'] = '1728000'

    #     render :text => '', :content_type => 'text/plain'
    #   end
    # end
end