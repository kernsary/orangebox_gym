require_relative("../db/sql_runner")

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :date_of_birth

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @date_of_birth = options["date_of_birth"]
  end

  def save()
    sql = "INSERT INTO members
    (first_name, last_name, date_of_birth)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@first_name, @last_name, @date_of_birth]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def update()
    sql = "UPDATE members
    SET (first_name, last_name, date_of_birth) = ($1, $2, $3)
    WHERE id = $4"
    values = [@first_name, @last_name, @date_of_birth, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members"
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
    sql = "DELETE FROM MEMBERS"
    SqlRunner.run(sql)
  end

  def self.map_members(data)
    result = data.map{|member| Member.new(member)}
    return result
  end

end
