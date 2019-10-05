require("minitest/autorun")
require("minitest/rg")
require_relative("../member.rb")

class MemberTest < MiniTest::Test

  def setup()
    @member1 = Member.new({"first_name" => "John", "last_name" => "Smith", "address" => "4 New Road, Muckletoun MT1 1AA"})

  end

  def test_set_first_name()
    @member1.set_first_name("Jim")
    assert_equal("Jim", @member1.first_name())
  end

  def test_set_last_name()
    @member1.set_last_name("Brown")
    assert_equal("Brown", @member1.last_name())
  end

  def test_set_address()
    @member1.set_address("99 South Street, Muckletoun MT5 9JJ")
    assert_equal("99 South Street, Muckletoun MT5 9JJ", @member1.address())
  end

end
