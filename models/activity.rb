require_relative("../db/sql_runner")
require_relative("member")

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

  def self.all()
    sql = "SELECT * FROM activities"
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
