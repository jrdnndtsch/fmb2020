class ProductsController < ShopifyApp::AuthenticatedController
	# before_action :authenticate_user!
	def index
		@products = ShopifyAPI::Product.find(:all, params: { limit: 10 }
	end
	def create
		require 'HTTParty'
		headers = {'X-Shopify-Access-Token' => @shop_session.token, 'Content-Type' => 'application/json'}
		base_uri = 'https://fbm2020-dev.myshopify.com/admin/products.json'
		
		StoredProduct.all.each do |c|
			if !c.posted
				tags = ''
				metafields = []

				#create tags
				c.tags.each do |tag|
					tags = tags +','+ tag.name
					tag.sub_tags.each do |sub_tag|
						tag = sub_tag.tag.name
						sub = tag +'-'+ sub_tag.name
						tags = tags +','+ sub
					end	
				end 

				c.creators.each do |p|
					name = p.first_name + ' ' + p.last_name
					creator_data =  {"key" => name, "value" => p.bio, "value_type" => "string", "namespace" => p.creator_type}
					metafields.push(creator_data)
				end 

				c.reviews.each do |r|
					if r.publication.present?
						quote = r.quote + '[[' + r.citation + ']]'
						review_data = {"key" => r.publication, "value" => quote, "value_type" => "string", "namespace" => "reviews"}
						metafields.push(review_data)
					end
				end 

				c.rights_holders.each do |r|
					rights_name = {"key" => "name", "value" => r.name, "value_type" => "string", "namespace" => "rights_holder"}
					rights_email = {"key" => "email", "value" => r.email, "value_type" => "string", "namespace" => "rights_holder"}
					rights_website = {"key" => "website", "value" => r.website, "value_type" => "string", "namespace" => "rights_holder"}
					metafields.push(rights_name, rights_email, rights_website)
				end 	

				metafields << {"key" => "pages", "value" => c.page_number, "value_type" => "integer", "namespace" => "book_data" }
				metafields << {"key" => "publication_date", "value" => c.publication_date.strftime("%m/%d/%Y"), "value_type" => "string", "namespace" => "book_data"} 
				metafields << {"key" => "publication_location", "value" => c.publication_location, "value_type" => "string", "namespace" => "book_data"} 
				metafields << {"key" => "rights_sold", "value" => c.rights_sold, "value_type" => "string", "namespace" => "book_data"} 
				metafields << {"key" => "age_range_start", "value" => c.age_range_start, "value_type" => "integer", "namespace" => "book_data"} 
				metafields << {"key" => "age_range_end", "value" => c.age_range_end, "value_type" => "integer", "namespace" => "book_data"}
				


				featured_image_src = "https:" + c.featured_image.url(:header)
				vendor_logo_src = "https:" + c.vendor_logo.url(:header)
				products_hash = {}
			  products_hash['title'] = c.title
			  products_hash['body_html'] = c.body_html
			  products_hash['vendor'] = c.vendor
			  products_hash['product_type'] = c.product_type
			  products_hash['published'] = c.published
			  products_hash['tags'] = tags
			  products_hash['metafields'] = metafields
			  products_hash['images'] = [{ "src" => featured_image_src}, {"src" => vendor_logo_src}]
				puts products_hash
			  request = HTTParty.post(
			  	base_uri,
			  	:body => {
			  		:product => products_hash
			  	}.to_json,
			  	:headers => headers
			  )

			  case request.code
			    when 201
			  		c.update(posted: true)
			  		puts "#{c.title} was posted!"
			    when 404
			      puts "O noes not found!"
			    when 500...600
			      puts "ZOMG ERROR #{response.code}"
			  end
			  
			end
		end
		@products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
		respond_to do |format|
		  format.js { render :partial => "product_list_js" }
		end
	end
end
