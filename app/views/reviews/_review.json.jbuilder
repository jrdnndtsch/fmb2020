json.extract! review, :id, :quote, :citation, :publication, :stored_product_id, :created_at, :updated_at
json.url review_url(review, format: :json)
