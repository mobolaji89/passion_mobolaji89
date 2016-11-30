helpers do
  def recent_photos(hashtag = "clown", resolution = "thumbnail")
    @photos = []
    instagram_response = 'https://api.instagram.com/v1/tags/' + hashtag +'/media/recent?client_id=8f78b349a86a4d79908869c6c54d3c36'
    p instagram_response
    response = Unirest.get(instagram_response)
    photos_array = response.body["data"]

    photos_array.each do |photo|
      image = photo["images"][resolution]["url"]
      @photos << image
    end

    @photos
  end

end
