json.extract! relationship, :id, :follower_id, :following_id, :created_at, :updated_at
json.url relationship_url(relationship, format: :json)
