class ProductsController < ShopifyApp::AuthenticatedController
	# before_action :authenticate_user!
	def index
		@products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
	end
	def create
		require 'httparty'
		headers = {'X-Shopify-Access-Token' => @shop_session.token, 'Content-Type' => 'application/json'}
		base_uri = 'https://fbm2020-dev.myshopify.com/admin/products.json'
		
		StoredProduct.all.each do |c|
			if !c.posted
				puts '>>>>>>>>>>>TITLE>>>>>>>>>>>>'
				puts c.title
				tags = ''
				metafields = []

				#create tags
				c.tags.each do |tag|
					tag.sub_tags.each do |sub_tag|
						tag = sub_tag.tag.name
						sub = sub_tag.name
						tags = tags +','+ sub
					end	
				end 

				#create all contributors as metafields
				c.creators.each_with_index do |p, i|
					if p.first_name.present? || p.last_name.present?
						current_creator = "creator_#{i}"
						name = p.first_name + ' ' + p.last_name
						creator_content = "#{name}[[#{p.bio}]]"
						creator_data =  {"key" => current_creator, "value" => creator_content, "value_type" => "string", "namespace" => p.creator_type}
						metafields.push(creator_data)
					end
				end 

				c.reviews.each_with_index do |r, i|
					if r.quote.present?
						current_review = "review_#{i}"
						review_content = "#{r.quote}[[#{r.link}]][[#{r.publication}]]"
						review_data = {"key" => current_review, "value" => review_content, "value_type" => "string", "namespace" => "reviews"}
						
						# review_data = {"key" => r.publication, "value" => quote, "value_type" => "string", "namespace" => "reviews"}
						metafields.push(review_data)
					end
				end 

			
				c.rights_holders.each do |r|
					rights_name = {"key" => "name", "value" => r.name, "value_type" => "string", "namespace" => "rights_holder"}
					rights_email = {"key" => "email", "value" => r.email, "value_type" => "string", "namespace" => "rights_holder"}
					rights_website = {"key" => "website", "value" => r.website, "value_type" => "string", "namespace" => "rights_holder"}
					metafields.push(rights_email, rights_website)
				end 

				c.awards.each_with_index do |r, i|
					current_award = "award_#{i}"

					award_data = {"key" => current_award, "value" => r.name, "value_type" => "string", "namespace" => "awards"}
					metafields.push(award_data)
				end	

				#	additional info as metafields 
				if c.page_number.present?	
					metafields << {"key" => "pages", "value" => c.page_number, "value_type" => "integer", "namespace" => "book_data" }
				end

				if c.publication_date.present?
					metafields << {"key" => "publication_date", "value" => c.publication_date.strftime("%m/%d/%Y"), "value_type" => "string", "namespace" => "book_data"} 
				end

				if c.rights_sold.present?
					metafields << {"key" => "rights_sold", "value" => c.rights_sold, "value_type" => "string", "namespace" => "book_data"} 
				end

				if c.age_range.present?
					metafields << {"key" => "age_range", "value" => c.age_range, "value_type" => "string", "namespace" => "book_data"} 
				end

				if c.age_range_other.present?
					metafields << {"key" => "age_range_other", "value" => c.age_range_other, "value_type" => "string", "namespace" => "book_data"} 
				end

				if c.materials_available.present?
					metafields << {"key" => "materials_available", "value" => c.materials_available, "value_type" => "string", "namespace" => "book_data"} 
				end

				if c.additional_materials.present?
					metafields << {"key" => "additional_materials", "value" => c.additional_materials, "value_type" => "string", "namespace" => "book_data"} 
				end

				if c.rights_available.present?
					metafields << {"key" => "rights_available", "value" => c.rights_available, "value_type" => "string", "namespace" => "book_data"} 
				end	

				if c.original_language.present?
					metafields << {"key" => "original_language", "value" => c.original_language, "value_type" => "string", "namespace" => "book_data"} 
				end	

				if c.series_name.present?
					metafields << {"key" => "series_name", "value" => c.series_name, "value_type" => "string", "namespace" => "book_data"} 
				end	
				if c.series_number.present?
					metafields << {"key" => "series_number", "value" => c.series_number, "value_type" => "string", "namespace" => "book_data"} 
				end	
				# metafields << {"key" => "age_range_start", "value" => c.age_range_start, "value_type" => "integer", "namespace" => "book_data"} 
				# metafields << {"key" => "age_range_end", "value" => c.age_range_end, "value_type" => "integer", "namespace" => "book_data"}
				


				featured_image_src = "https:" + c.featured_image.url(:header)
				vendor_logo_src = "https:" + c.vendor_logo.url(:header)
				products_hash = {}
			  products_hash['title'] = c.title
			  products_hash['body_html'] = c.body_html
			  products_hash['vendor'] = c.vendor
			  products_hash['product_type'] = c.tags.first.name
			  # products_hash['type'] = c.tags.first.name
			  products_hash['published'] = c.published
			  if tags.present?
			  	products_hash['tags'] = tags
			  end 
			  products_hash['metafields'] = metafields
			  products_hash['images'] = [{ "src" => featured_image_src}, {"src" => vendor_logo_src}]
				puts products_hash
				#delete a metafield if it has no value as it will not be submitted to Shopify
				products_hash['metafields'].delete_if { |h| h["value"].size <= 0 }
			  request = HTTParty.post(
			  	base_uri,
			  	:body => {
			  		:product => products_hash
			  	}.to_json,
			  	:headers => headers, 
			  	:debug_output => $stdout
			  )
			  puts '>>>>>>>>>>>CODE>>>>>>>>>>>>'
			  puts request.code


			  case request.code
				when 201
					puts request.parsed_response["product"]["id"]
					puts "RESUTL OF POST PROD<<<<<<<<<<<<<<<<<"
			  		c.update(posted: true, shopify_product_id: request.parsed_response["product"]["id"].to_s)
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
