require_relative("../db/sql_runner")
require_relative("booking")

class Member

  attr_reader :id, :first_name, :last_name, :address

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @address = options["address"]
  end

  def set_first_name(new_first_name)
    @first_name = new_first_name
  end

  def set_last_name(new_last_name)
    @last_name = new_last_name
  end

  def set_address(new_address)
    @address = new_address
  end

  def save()
    sql = "INSERT INTO members
    (first_name, last_name, address)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@first_name, @last_name, @address]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def update()
    sql = "UPDATE members
    SET (first_name, last_name, address) = ($1, $2, $3)
    WHERE id = $4"
    values = [@first_name, @last_name, @address, @id]
    SqlRunner.run(sql, values)
  end

  def bookings()
    sql = "SELECT * FROM bookings
    WHERE member_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Booking.map_bookings(result)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members
    ORDER BY first_name, last_name"
    result = SqlRunner.run(sql)
    return self.map_members(result)
  end

  def self.find(id)
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Member.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.map_members(data)
    result = data.map{|member| Member.new(member)}
    return result
  end

end
