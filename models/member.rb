require_relative("../db/sql_runner")

class Member

  attr_reader :id, :first_name, :last_name, :date_of_birth

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

end
