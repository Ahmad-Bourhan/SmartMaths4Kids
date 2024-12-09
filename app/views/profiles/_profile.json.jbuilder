json.extract! profile, :id, :usre_id, :firstName, :lastName, :age, :created_at, :updated_at
json.url profile_url(profile, format: :json)
