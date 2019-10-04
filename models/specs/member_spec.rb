require("minitest/autorun")
require("minitest/rg")

require_relative("../member")

def setup()
  @member1 = Member.new({"first_name" => "John", "last_name" => "Smith", "date_of_birth" => "5/10/1995"})
end

class MemberTest < MiniTest::Test

  def test_get_first_name
    assert_equal("John", @member1.first_name)
  end

  def test_get_last_name
    assert_equal("Smith", @member1.last_name)
  end

  def test_get_date_of_birth
    assert_equal("5/10/1995", @member1.date_of_birth)
  end

end
