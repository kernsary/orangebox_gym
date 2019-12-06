# solo_project_gym

This is a web app to handle members, activities and bookings for a gym.

It uses PSQL, Ruby, the Ruby package for PSQL 'pg', the Ruby debugging package 'pry' and the web framework Sinatra via the Ruby packages 'sinatra' and 'sinatra/contrib/all'. If you want to run the specs files, you also need the Ruby packages 'minitest/autorun' and 'minitest/rg'.

To run the programme, carry out the following steps in the Terminal:

* Navigate to the 'gym' directory
* Create a new database called 'gym' using 'dropdb gym' followed by 'createdb gym'
* Run the SQL file using 'psql -d gym -f db/gym.sql'
* Run the seed data using 'ruby db/seeds.rb'
* Quit out of 'pry' by typing '!!!' or 'exit'.
* Run the main app using 'ruby app.rb'

The server will run and will say what port is being used ('has taken the stage on ...'), eg '4567'.

Open a new browser window and type in 'localhost:', the port number and '/gym' (eg 'localhost:4567/gym'), and the home page of the app will display.

The app meets the MVP of the brief below plus the first of the 'Possible Extensions', and has additional functionality including the ability to add or remove new members for each activity, and vice versa. It was created as a solo project at CodeClan.

## Brief

### Gym
A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.

MVP
* The app should allow the gym to create / edit / delete members
* The app should allow the gym to create / edit / delete classes
* The app should allow the gym to add members to specific classes
* The app should show a list of all upcoming classes
* The app should show all members that are registered for a particular class

Inspired By
Glofox, Pike13

Possible Extensions
* Classes could have a maximum capacity, and users can only be added while there is space remaining.
* The gym could be able to give its members Premium or Standard membership. Standard members can only be signed up for classes during off-peak hours.
