require 'sinatra'
require 'json'

# returns JSON "true" if the validated instance does not contain the word "invalid", "false" otherwise.
post '/validate', provides: :json do
  pass unless request.accept? 'application/json'
  json_params = JSON.parse request.body.read
	is_invalid = (json_params["instance"].nil?) ? false : !(json_params["instance"].include? "invalid")
	puts "Input valid - returning JSON true" if is_invalid
  puts "Input invalid - returning JSON false" if is_invalid
  content_type :json
	is_invalid.to_json
end