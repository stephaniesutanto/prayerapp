json.extract! prayer, :id, :name, :description, :category, :pray, :status, :created_at, :updated_at
json.url prayer_url(prayer, format: :json)