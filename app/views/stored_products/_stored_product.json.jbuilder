json.extract! stored_product, :id, :title, :body_html, :vendor, :product_type, :published, :created_at, :updated_at
json.url stored_product_url(stored_product, format: :json)
