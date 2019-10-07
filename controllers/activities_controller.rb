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

get "/gym/activities/:id" do
  @activity = Activity.find(params["id"])
  erb(:"activities/show")
end

get "/gym/activities/:id/edit" do
  @activity = Activity.find(params["id"])
  erb(:"activities/edit")
end

post "/gym/activities/:id" do
  activity = Activity.new(params)
  activity.update()
  redirect to "/gym/activities/#{params[:id]}"
end
