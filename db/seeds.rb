require_relative("../models/member")
require("pry")

member1 = Member.new({"first_name" => "John", "last_name" => "Smith", "date_of_birth" => "5/10/1995"})

member1.save()

binding.pry
nil
