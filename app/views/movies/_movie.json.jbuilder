json.extract! movie, :id, :title, :png_name, :desc, :created_at, :updated_at
json.url movie_url(movie, format: :json)
