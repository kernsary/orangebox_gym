require_relative("../models/member")
also_reload("../models/*")

get "/gym/members" do
  @members = Member.all()
  erb(:"members/index")
end

get "/gym/members/new" do
  erb(:"members/new")
end
