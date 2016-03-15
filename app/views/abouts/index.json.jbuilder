json.array!(@abouts) do |about|
  json.extract! about, :id, :mission, :vision, :company
  json.url about_url(about, format: :json)
end
