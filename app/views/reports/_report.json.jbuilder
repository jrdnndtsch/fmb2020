json.extract! report, :id, :email, :created_at, :updated_at
json.url report_url(report, format: :json)
