require_relative("../models/activity")
require_relative("../models/booking")
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
  redirect to "/gym/activities/#{params["id"]}"
end

post "/gym/activities/:id/delete" do
  activity = Activity.find(params["id"])
  activity.delete()
  redirect to "/gym/activities"
end

post "/gym/activities/:id/:booking_id/booking_delete" do
  booking = Booking.find(params["booking_id"])
  booking.delete()
  redirect to "/gym/activities/#{params["id"]}"
end

get "/gym/activities/:id/booking_new" do
  @activity = Activity.find(params["id"])
  @members = Member.all()
  erb(:"activities/booking_new")
end

post "/gym/activities/:activity_id/booking" do
  Booking.new(params).save()
  redirect to "/gym/activities/#{params["activity_id"]}"
end
