require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @input = params["number"]
  @result = @input.to_f ** 2
  erb(:square) 
end
