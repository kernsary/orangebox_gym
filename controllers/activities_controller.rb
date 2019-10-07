require_relative("../models/activity")
also_reload("../models/*")

get "/gym/activities" do
  @activities = Activity.all()
  erb(:"activities/index")
end
