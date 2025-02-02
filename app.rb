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
  @result = @input.to_f ** 1/2
  erb(:square_root) 
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @input_apr = (params["user_apr"] / 100).to_f.to_fs(:percentage, {:precision => 4})
  @input_yrs = params["user_years"]
  @input_pv = params["user_pv"].to_f.to_fs(:currency)
  @result = @input_apr * @input_pv / (1 - (1 + @input_apr) ** (-@input_yrs.to_f))
  @resultf = @result.to_fs(:currency)
  erb(:payment) 
end


get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @input = params["number"]
  @result = @input.to_f ** 2
  erb(:random) 
end
