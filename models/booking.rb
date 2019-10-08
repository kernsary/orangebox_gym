require_relative("../db/sql_runner")
require_relative("member")
require_relative("activity")

class Booking

  attr_reader :id, :member_id, :activity_id

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @member_id = options["member_id"].to_i()
    @activity_id = options["activity_id"].to_i()
  end

  def set_member_id(new_member_id)
    @member_id = new_member_id
  end

  def set_activity_id(new_activity_id)
    @activity_id = new_activity_id
  end

  def save()
    sql = "INSERT INTO bookings
    (member_id, activity_id)
    VALUES ($1, $2)
    RETURNING id"
    values = [@member_id, @activity_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def member()
    return Member.find(@member_id)
  end

  def activity()
    return Activity.find(@activity_id)
  end

  def update()
    sql = "UPDATE bookings
    SET (member_id, activity_id)
    = ($1, $2)
    WHERE id = $3"
    values = [@member_id, @activity_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bookings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    result = SqlRunner.run(sql)
    unsorted_bookings = self.map_bookings(result)
    return unsorted_bookings.sort_by{|booking| booking.activity.name()}
  end

  def self.find(id)
    sql = "SELECT * FROM bookings
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Booking.new(result)
  end

  def self.find_by_member(member_id)
    sql = "SELECT * FROM bookings
    WHERE member_id = $1"
    values = [member_id]
    result = SqlRunner.run(sql, values)[0]
    return Booking.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.map_bookings(data)
    return data.map{|booking| Booking.new(booking)}
  end

end
