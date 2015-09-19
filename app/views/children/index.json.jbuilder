json.array!(@children) do |child|
  json.extract! child, :id, :name, :image_url, :school, :balance, :user_id
  json.url child_url(child, format: :json)
end
