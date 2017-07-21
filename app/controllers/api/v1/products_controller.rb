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
          if params['product']
            #create new stored product
            @product = StoredProduct.new
            product_hash =  params['product']['product'].permit([:title, :body_html, :vendor, :product_type, :published, :featured_image]).to_h
            puts product_hash
            
            @product.assign_attributes(product_hash)
            # make a hash for each table and create with the prod
            rights_holder_hash = params['product']['vendor'].permit([:name, :website, :email]).to_h
            @product.rights_holders.new(rights_holder_hash)
            
            params['product']['review'].each do |review|
              review_hash = params['product']['review'][review].permit([:quote, :citation, :publication]).to_h
              @product.reviews.new(review_hash)
            end 
            params['product']['creator'].each do |creator|
              creator_hash = params['product']['creator'][creator].permit([:creator_type, :first_name, :last_name]).to_h
              @product.creators.new(creator_hash)
            end
            params['product']['tags'].each do |tag|
              @tag = @product.tags.new(name: tag)
              params['product']['tags'][tag]['sub_tags'].each do |sub|  
                @tag.sub_tags.new(name: sub)
              end  
            end
          end
          if params['featured_image'] && params['vendor_logo']
            puts params
            @product = StoredProduct.find(params['id'])
            @product.update(featured_image: params['featured_image'], vendor_logo: params['vendor_logo'])
          end
          
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