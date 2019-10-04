require_relative("../models/member")
require("pry")

Member.delete_all

member1 = Member.new({"first_name" => "John", "last_name" => "Smith", "date_of_birth" => "5/10/1995"})
member2 = Member.new({"first_name" => "Sarah", "last_name" => "Docherty", "date_of_birth" => "4/9/1994"})

member1.save()
member2.save()

binding.pry
nil
