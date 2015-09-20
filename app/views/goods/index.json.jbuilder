json.array!(@goods) do |good|
  json.extract! good, :id, :name, :price, :image_url, :category
  json.url good_url(good, format: :json)
end
