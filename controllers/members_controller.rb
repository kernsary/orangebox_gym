require_relative("../models/member")
also_reload("../models/*")

get "/gym/members" do
  @members = Member.all()
  erb(:"members/index")
end

get "/gym/members/new" do
  erb(:"members/new")
end

post "/gym/members" do
  Member.new(params).save()
  redirect to "/gym/members"
end

get "/gym/members/:id" do
@member = Member.find(params["id"])
  erb(:"members/show")
end

get "/gym/members/:id/edit" do
  @member = Member.find(params["id"])
  erb(:"members/edit")
end

post "/gym/members/:id" do
  member = Member.new(params)
  member.update()
  redirect to "/gym/members/#{params["id"]}"
end

post "/gym/members/:id/delete" do
  member = Member.find(params["id"])
  member.delete()
  redirect to "/gym/members"
end

post "/gym/members/:booking_id/booking_delete" do
  booking = Booking.find(params["booking_id"])
  member_id = booking.member_id()
  booking.delete()
  redirect to "/gym/members/#{member_id}"
end

get "/gym/members/:id/booking_new" do
  @member = Member.find(params["id"])
  @activities = Activity.all()
  erb(:"members/booking_new")
end

post "/gym/members/:member_id/booking" do
  Booking.new(params).save()
  redirect to "/gym/members/#{params["member_id"]}"
end
