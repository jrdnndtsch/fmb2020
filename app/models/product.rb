class	Product
	def self.createShopifyProduct(product_data)
		@product = StoredProduct.new
		@product.assign_attributes(title: product_data['product']['title'], body_html: product_data['product']['body_html'])
		
	end

end