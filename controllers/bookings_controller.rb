require_relative("../models/booking")
require_relative("../models/member")
require_relative("../models/activity")
also_reload("../models/*")

get "/gym/bookings" do
  @bookings = Booking.all()
  erb(:"bookings/index")
end

get "/gym/bookings/new" do
  @members = Member.all()
  @activities = Activity.all()
  erb(:"bookings/new")
end

post "/gym/bookings" do
  Booking.new(params).save()
  redirect to "/gym/bookings"
end

get "/gym/bookings/:id" do
  @booking = Booking.find(params[:id])
  @member = @booking.member
  @activity = @booking.activity
  erb(:"bookings/show")
end

get "/gym/bookings/:id/edit" do
  @booking = Booking.find(params[:id])
  @members = Member.all()
  @activities = Activity.all()
  @member = @booking.member
  @activity = @booking.activity
  erb(:"bookings/edit")
end

post "/gym/bookings/:id" do
  booking = Booking.new(params)
  booking.update()
  redirect to "/gym/bookings/#{params["id"]}"
end

post "/gym/bookings/:id/delete" do
  booking = Booking.find(params["id"])
  booking.delete()
  redirect to "/gym/bookings"
end
