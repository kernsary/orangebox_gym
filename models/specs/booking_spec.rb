require("minitest/autorun")
require("minitest/rg")
require_relative("../booking")

class BookingTest < MiniTest::Test

  def setup
    @booking1 = Booking.new({"member_id" => 1, "activity_id" => 1})
  end

  def test_set_member_id()
    @booking1.set_member_id(3)
    assert_equal(3, @booking1.member_id)
  end

  def test_set_activity_id()
    @booking1.set_activity_id(4)
    assert_equal(4, @booking1.activity_id)
  end

end
