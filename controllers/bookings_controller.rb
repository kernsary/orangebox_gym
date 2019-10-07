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
