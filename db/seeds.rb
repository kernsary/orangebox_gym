require_relative("../models/member")
require_relative("../models/activity")
require_relative("../models/booking")
require("pry")

Booking.delete_all
Member.delete_all
Activity.delete_all

member1 = Member.new({"first_name" => "Sara", "last_name" => "Ibrahim", "address" => "4 New Road, Muckletoun MT1 1AA"})
member2 = Member.new({"first_name" => "Sarah", "last_name" => "Docherty", "address" => "10 Low Road, Muckletoun MT2 3HH"})
member3 = Member.new({"first_name" => "Jo", "last_name" => "Wilson", "address" => "25 High Road, Muckletoun MT3 4BB"})
member4 = Member.new({"first_name" => "Alan", "last_name" => "McKay", "address" => "39 Kirk Brae, Muckletoun MT6 4AJ"})
member5 = Member.new({"first_name" => "Kirsty", "last_name" => "Jones", "address" => "325 Sair Pech Brae, Muckletoun MT9 6TT"})
member6 = Member.new({"first_name" => "Darren", "last_name" => "Blackie", "address" => "14 Hill Street, Muckletoun MT8 5NK"})

member1.save()
member2.save()
member3.save()
member4.save()
member5.save()
member6.save()

activity1 = Activity.new({"name" => "Yoga Beginners", "day" => "Thursday", "start_time" => "18:30", "end_time" => "20.00"})
activity2 = Activity.new({"name" => "Yoga Intermediate", "day" => "Tuesday", "start_time" => "18:00", "end_time" => "19.30"})
activity3 = Activity.new({"name" => "PowerSurge", "day" => "Monday", "start_time" => "07:15", "end_time" => "08:00"})
activity4 = Activity.new({"name" => "BoxFox", "day" => "Tuesday", "start_time" => "07:15", "end_time" => "08:00"})
activity5 = Activity.new({"name" => "DynaPump", "day" => "Wednesday", "start_time" => "07:15", "end_time" => "08:00"})
activity6 = Activity.new({"name" => "MegaStretch", "day" => "Thursday", "start_time" => "07:15", "end_time" => "08:00"})
activity7 = Activity.new({"name" => "RamboSmash", "day" => "Friday", "start_time" => "07:15", "end_time" => "08:00"})
activity8 = Activity.new({"name" => "BoxFox", "day" => "Saturday", "start_time" => "07:15", "end_time" => "08:00"})
activity9 = Activity.new({"name" => "BashCrash", "day" => "Sunday", "start_time" => "07:15", "end_time" => "08:00"})
activity10 = Activity.new({"name" => "BoxFox", "day" => "Wednesday", "start_time" => "18:15", "end_time" => "19.45"})

activity1.save()
activity2.save()
activity3.save()
activity4.save()
activity5.save()
activity6.save()
activity7.save()
activity8.save()
activity9.save()
activity10.save()

booking1 = Booking.new({"member_id" => member1.id, "activity_id" => activity3.id})
booking2 = Booking.new({"member_id" => member2.id, "activity_id" => activity2.id})
booking3 = Booking.new({"member_id" => member2.id, "activity_id" => activity3.id})
booking4 = Booking.new({"member_id" => member5.id, "activity_id" => activity5.id})
booking5 = Booking.new({"member_id" => member6.id, "activity_id" => activity5.id})
booking6 = Booking.new({"member_id" => member4.id, "activity_id" => activity5.id})
booking7 = Booking.new({"member_id" => member3.id, "activity_id" => activity6.id})
booking8 = Booking.new({"member_id" => member5.id, "activity_id" => activity4.id})
booking9 = Booking.new({"member_id" => member6.id, "activity_id" => activity10.id})
booking10 = Booking.new({"member_id" => member2.id, "activity_id" => activity8.id})

booking1.save()
booking2.save()
booking3.save()
booking4.save()
booking5.save()
booking6.save()
booking7.save()
booking8.save()
booking9.save()
booking10.save()

binding.pry
nil
