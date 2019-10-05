require_relative("../db/sql_runner")

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


end
