require("minitest/autorun")
require("minitest/rg")
require_relative("../activity.rb")

class ActivityTest < MiniTest::Test

  def setup()
    @activity1 = Activity.new({"name" => "Yoga Beginners", "day" => "Thursday", "start_time" => "18:30", "end_time" => "20.00"})
    @activity2 = Activity.new({"name" => "Yoga Intermediate", "day" => "Tuesday", "start_time" => "18:00", "end_time" => "19.30"})
  end

  def test_set_name()
    @activity1.set_name("Tai Chi")
    assert_equal("Tai Chi", @activity1.name())
  end

  def test_set_day()
    @activity1.set_day("Wednesay")
    assert_equal("Wednesay", @activity1.day())
  end

  def test_set_start_time()
    @activity1.set_start_time("18.15")
    assert_equal("18.15", @activity1.start_time())
  end

  def test_set_end_time()
    @activity1.set_end_time("19.45")
    assert_equal("19.45", @activity1.end_time())
  end

end
