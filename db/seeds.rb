require_relative("../models/member")
require_relative("../models/activity")
require_relative("../models/booking")
require("pry")

Booking.delete_all
Member.delete_all
Activity.delete_all

member1 = Member.new({"first_name" => "John", "last_name" => "Smith", "date_of_birth" => "5/10/1995"})
member2 = Member.new({"first_name" => "Sarah", "last_name" => "Docherty", "date_of_birth" => "4/9/1994"})
member3 = Member.new({"first_name" => "Jo", "last_name" => "Wilson", "date_of_birth" => "5/3/1990"})

member1.save()
member2.save()
member3.save()

activity1 = Activity.new({"name" => "Yoga Beginners", "day" => "Thursday", "start_time" => "18:30", "end_time" => "20.00"})
activity2 = Activity.new({"name" => "Yoga Intermediate", "day" => "Tuesday", "start_time" => "18:00", "end_time" => "19.30"})
activity3 = Activity.new({"name" => "PowerSurge", "day" => "Monday", "start_time" => "07:15", "end_time" => "08:00"})

activity1.save()
activity2.save()
activity3.save()

booking1 = Booking.new({"member_id" => member1.id, "activity_id" => activity3.id})
booking2 = Booking.new({"member_id" => member2.id, "activity_id" => activity2.id})
booking3 = Booking.new({"member_id" => member2.id, "activity_id" => activity3.id})


booking1.save()
booking2.save()
booking3.save()

binding.pry
nil
