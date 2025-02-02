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

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @input = params["number"]
  @result = @input.to_f ** 0.5
  erb(:square_root) 
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @input_apr = params["user_apr"].to_f / 100
  @input_yrs = params["user_years"]
  @input_pv = params["user_pv"].to_f

  monthly_apr = @input_apr / 12
  months = @input_yrs.to_f * 12
  @result = monthly_apr * @input_pv / (1 - (1 + monthly_apr) ** (-months))
  erb(:payment)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @input_min = params["user_min"].to_f
  @input_max = params["user_max"].to_f
  @result = rand(@input_min..@input_max)
  erb(:random) 
end
