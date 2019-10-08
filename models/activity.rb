require_relative("../db/sql_runner")
require_relative("member")
require_relative("booking")

class Activity

  attr_reader :id, :name, :day, :start_time, :end_time

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @day = options["day"]
    @start_time = options["start_time"]
    @end_time = options["end_time"]
  end

  def set_name(new_name)
    @name = new_name
  end

  def set_day(new_day)
    @day = new_day
  end

  def set_start_time(new_start_time)
    @start_time = new_start_time
  end

  def set_end_time(new_end_time)
    @end_time = new_end_time
  end

  def save()
    sql = "INSERT INTO activities
    (name, day, start_time, end_time)
    VALUES ($1, $2, $3, $4)
    RETURNING id"
    values = [@name, @day, @start_time, @end_time]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def update()
    sql = "UPDATE activities
    SET (name, day, start_time, end_time)
    = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @day, @start_time, @end_time, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM activities
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def members()
    sql = "SELECT members.* FROM members
    INNER JOIN bookings
    ON members.id = bookings.member_id
    WHERE bookings.activity_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Member.map_members(result)
  end

  def bookings()
    sql = "SELECT * FROM bookings
    WHERE activity_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Booking.map_bookings(result)
  end

  def add_participant(participant_id)
    new_booking = Booking.new({"member_id" => participant_id, "activity_id" => @id})
    new_booking.save()
  end

  def remove_participant(participant_id)
    booking = Booking.find_by_member(participant_id)
    booking.delete()
  end

  def self.all()
    sql = "SELECT * FROM activities
    ORDER BY name, day, start_time"
    result = SqlRunner.run(sql)
    return self.map_activities(result)
  end

  def self.find(id)
    sql = "SELECT * FROM activities
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Activity.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM activities"
    SqlRunner.run(sql)
  end

  def self.map_activities(data)
    return data.map{|activity| Activity.new(activity)}
  end

end
