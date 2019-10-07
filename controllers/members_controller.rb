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
