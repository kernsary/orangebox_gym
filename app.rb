require("sinatra")
require("sinatra/contrib/all")
# require_relative("controllers/activities_controller")
require_relative("controllers/members_controller")
# require_relative("contollers/bookings_controller")

get "/gym" do
  erb(:home)
end
