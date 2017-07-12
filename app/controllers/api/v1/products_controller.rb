module Api
  module V1
    class ProductsController < Api::BaseController
    	def index
    		@thing = {:thing => "the thing"}
    		render json: @thing

    	end
    	def create
				if @product.present?
		      render nothing: true, status: :conflict
		    else
		      @product = StoredProduct.new
		      @product.assign_attributes(title: params['product']['title'])
		      if @product.save
		        render json: @product
		      else
		         render nothing: true, status: :bad_request
		      end
		    end

    		# @stuff = params['product']
    		# render json: @stuff
    	end
    end
  end
end