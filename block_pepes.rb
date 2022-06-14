require "uri"
require "json"
require "net/http"

# Set these
broadcaster_id = "" # your numeric ID, not username

# TAU stuff
# NOTE: If not using TAU, you'll need to change your URL and auth headers
tau_token = ""
tau_base_url = "" # no trailing slash

pepes = File.read('./pepes.json')

# Twitch URL
# url = URI("https://api.twitch.tv/helix/moderation/blocked_terms?broadcaster_id=#{broadcaster_id}&moderator_id=#{broadcaster_id}")

# TAU URL
url = URI("#{tau_base_url}/api/twitch/helix/moderation/blocked_terms?broadcaster_id=#{broadcaster_id}&moderator_id=#{broadcaster_id}")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

JSON.parse(pepes).each do |pepe|
  request = Net::HTTP::Post.new(url)
  
  # TAU auth
  request["Authorization"] = "Token #{tau_token}"
  
  # Twitch auth
  # request["Authorization"] = "Bearer <your-twitch-token>"
  # request["Client-Id"] = "<your-twitch-client-id>"

  request["Content-Type"] = "application/json"
  request.body = JSON.dump({
    "text": pepe
  })
  
  response = https.request(request)
  puts response.read_body
  sleep 2
end
