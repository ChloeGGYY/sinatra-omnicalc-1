require "sinatra"
require "sinatra/reloader"


get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num =params.fetch("user_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_root)
end

get("/square_root/results") do
  @the_num =params.fetch("user_number").to_f
  @the_result = @the_num ** 0.5
  erb(:root_results)
end

get("/payment/new") do
  erb(:new_payment)
end

get("/payment/results") do
  @the_apr =params.fetch("user_apr").to_f/100
  @the_year = params.fetch("user_years").to_i
  @the_principal = params.fetch("user_pv").to_f 
  @the_payment = (@the_principal * (@the_apr/12)) / (1 - (1 + @the_apr/12)**(-12*@the_year))
  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @the_min =params.fetch("user_min").to_f
  @the_max = params.fetch("user_max").to_f
  @the_random = rand(@the_min..@the_max).to_f
  erb(:random_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
