require_relative("../models/activity")
also_reload("../models/*")

get "/gym/activities" do
  @activities = Activity.all()
  erb(:"activities/index")
end

get "/gym/activities/new" do
  erb(:"activities/new")
end

post "/gym/activities" do
  Activity.new(params).save()
  redirect to "/gym/activities"
end
