json.extract! admin_game, :id, :name, :description, :created_at, :updated_at
json.url admin_game_url(admin_game, format: :json)