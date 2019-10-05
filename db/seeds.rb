require_relative("../models/member")
require_relative("../models/activity")
require("pry")

Member.delete_all
Activity.delete_all

member1 = Member.new({"first_name" => "John", "last_name" => "Smith", "date_of_birth" => "5/10/1995"})
member2 = Member.new({"first_name" => "Sarah", "last_name" => "Docherty", "date_of_birth" => "4/9/1994"})

member1.save()
member2.save()

activity1 = Activity.new({"name" => "Yoga Beginners", "day" => "Thursday", "start_time" => "18:30", "end_time" => "20.00"})
activity2 = Activity.new({"name" => "Yoga Intermediate", "day" => "Tuesday", "start_time" => "18:00", "end_time" => "19.30"})

activity1.save()
activity2.save()

binding.pry
nil
