require_relative("../db/sql_runner")

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

end
